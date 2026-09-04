package com.solvex.actionapp

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.OpenableColumns
import android.provider.Settings
import android.view.WindowManager
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

/**
 * Adds the few capabilities Flutter has no way to reach on its own.
 *
 * **Why FlutterFragmentActivity rather than FlutterActivity.** App Lock uses
 * androidx BiometricPrompt through `local_auth`, and BiometricPrompt can only
 * be shown from a FragmentActivity — it needs a FragmentManager to host its
 * dialog. This is the base class `local_auth` documents, and it is a superset
 * of what the app previously used.
 *
 * The channels below are here for the same reason as each other: a whole
 * dependency for a single system call is a worse trade than a few lines of
 * Kotlin. Share-in is the strongest case of the three — the interesting part
 * of receiving a share is validating an untrusted URI, and that is exactly the
 * part a plugin would be doing on this app's behalf.
 */
class MainActivity : FlutterFragmentActivity() {
    private val settingsChannel = "com.solvex.actionapp/system_settings"
    private val privacyChannel = "com.solvex.actionapp/screen_privacy"
    private val shareChannel = "com.solvex.actionapp/share_in"

    /**
     * A share that has arrived and not yet been handed to Dart.
     *
     * Held rather than pushed because Dart may not be listening yet: a cold
     * start delivers the intent before the engine exists. Dart asks for it when
     * it is ready, and asking clears it — an intent must be acted on once, not
     * once per rebuild.
     */
    private var pendingShare: Map<String, Any?>? = null

    private var shareMethods: MethodChannel? = null

    /**
     * The Dart caller waiting for a document picker to come back.
     *
     * One at a time: the picker is a full-screen system activity, so a second
     * request can only arrive if the first was abandoned, and answering the
     * stale one would deliver a file to a screen that has gone.
     */
    private var pendingPick: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            settingsChannel,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "openNotificationSettings" -> result.success(openNotificationSettings())
                "packageVersion" -> result.success(packageVersion())
                else -> result.notImplemented()
            }
        }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            privacyChannel,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "setSecure" -> {
                    val enabled = call.argument<Boolean>("enabled") ?: false
                    result.success(setSecure(enabled))
                }
                "isSupported" -> result.success(true)
                else -> result.notImplemented()
            }
        }

        shareMethods = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            shareChannel,
        ).also { channel ->
            channel.setMethodCallHandler { call, result ->
                when (call.method) {
                    "consumePendingShare" -> {
                        val share = pendingShare
                        pendingShare = null
                        result.success(share)
                    }
                    "pickDocument" -> pickDocument(result)
                    else -> result.notImplemented()
                }
            }
        }

        // The launching intent. Read here rather than in onCreate because the
        // engine has to exist before there is anywhere to hold the result, and
        // a cold-start share arrives before Dart is listening either way.
        readShare(intent)
    }

    /**
     * A share that arrives while Action is already running.
     *
     * `setIntent` matters: without it `getIntent()` keeps returning the
     * original launch intent, so a second share would be read as a repeat of
     * the first.
     */
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        if (readShare(intent)) {
            shareMethods?.invokeMethod("shareArrived", null)
        }
    }

    /**
     * Turns an ACTION_SEND intent into something Dart can act on, or does
     * nothing.
     *
     * **Everything here treats the payload as hostile.** The sender chose the
     * URI, the MIME type and the file name, and none of them has been checked
     * by anyone. So: the stream is read here, while the temporary read grant is
     * still valid, into a file this app owns — Dart never handles a `content://`
     * URI and never depends on a permission that expires. The declared MIME is
     * passed along as a *claim*; Dart checks it against the actual leading
     * bytes before believing it. The size is capped so a hostile or accidental
     * multi-gigabyte share cannot exhaust memory before any of that happens.
     */
    private fun readShare(intent: Intent?): Boolean {
        if (intent == null) return false
        if (intent.action != Intent.ACTION_SEND) return false

        val type = intent.type ?: return false

        if (type.startsWith("text/")) {
            val text = intent.getStringExtra(Intent.EXTRA_TEXT) ?: return false
            if (text.isBlank()) return false
            // Truncated rather than refused: a very long share is still
            // usable, and the alternative is silently dropping it.
            val bounded = if (text.length > MAX_TEXT_CHARS) {
                text.substring(0, MAX_TEXT_CHARS)
            } else {
                text
            }
            pendingShare = mapOf(
                "kind" to "text",
                "text" to bounded,
                "truncated" to (text.length > MAX_TEXT_CHARS),
            )
            return true
        }

        val uri: Uri = (
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                intent.getParcelableExtra(Intent.EXTRA_STREAM, Uri::class.java)
            } else {
                @Suppress("DEPRECATION")
                intent.getParcelableExtra(Intent.EXTRA_STREAM)
            }
            ) ?: return false

        val copied = copyToOwnStorage(uri)
        if (copied == null) {
            // Says so rather than dropping it. A share that simply vanishes
            // leaves the user believing Action took it — which is the worst
            // outcome available here, because they will not send it again.
            //
            // This is the path a revoked or expired URI grant takes, and it is
            // reachable in practice: the grant is attached to the intent, and
            // an intent can be replayed or forwarded by something that no
            // longer holds it.
            pendingShare = mapOf("kind" to "unreadable")
            return true
        }
        pendingShare = mapOf(
            "kind" to "file",
            "path" to copied.absolutePath,
            // A claim, not a fact. Dart checks it against the bytes.
            "declaredMimeType" to type,
            "declaredName" to displayName(uri),
            "size" to copied.length(),
        )
        return true
    }

    /**
     * Opens the system document picker for the types Action can read.
     *
     * `ACTION_OPEN_DOCUMENT` rather than `GET_CONTENT`: it is the modern
     * picker, it returns a stable URI, and it does not require any storage
     * permission — the user granting access to one file *is* the permission.
     * Action never asks to read the user's documents, only the one they hand
     * over.
     */
    private fun pickDocument(result: MethodChannel.Result) {
        pendingPick?.success(null)
        pendingPick = result
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT)
            .addCategory(Intent.CATEGORY_OPENABLE)
            .setType("application/pdf")
            .putExtra(Intent.EXTRA_LOCAL_ONLY, false)
        try {
            startActivityForResult(intent, PICK_DOCUMENT_REQUEST)
        } catch (error: Exception) {
            pendingPick = null
            result.success(null)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode != PICK_DOCUMENT_REQUEST) {
            super.onActivityResult(requestCode, resultCode, data)
            return
        }
        val waiting = pendingPick
        pendingPick = null
        if (waiting == null) return

        val uri = data?.data
        if (resultCode != Activity.RESULT_OK || uri == null) {
            // Cancelled. Null rather than an error: backing out of a picker is
            // an ordinary thing to do and is not a failure to report.
            waiting.success(null)
            return
        }

        // Copied here, exactly like a share: the read grant belongs to this
        // result and Dart should never depend on it lasting.
        val copied = copyToOwnStorage(uri)
        if (copied == null) {
            waiting.success(mapOf("kind" to "unreadable"))
            return
        }
        waiting.success(
            mapOf(
                "kind" to "file",
                "path" to copied.absolutePath,
                "declaredMimeType" to (contentResolver.getType(uri) ?: ""),
                "declaredName" to displayName(uri),
                "size" to copied.length(),
            ),
        )
    }

    /**
     * Copies the shared stream into this app's cache and returns the file.
     *
     * Null on anything unexpected — an unreadable URI, a stream that turns out
     * to be larger than the cap, a write that fails. A partial copy is deleted
     * rather than handed on: half a JPEG is not a smaller JPEG.
     */
    private fun copyToOwnStorage(uri: Uri): File? {
        val directory = File(cacheDir, "shared").apply { mkdirs() }
        val target = File(directory, "share_${System.currentTimeMillis()}")

        return try {
            contentResolver.openInputStream(uri).use { input ->
                if (input == null) return null
                target.outputStream().use { output ->
                    val buffer = ByteArray(64 * 1024)
                    var total = 0L
                    while (true) {
                        val read = input.read(buffer)
                        if (read <= 0) break
                        total += read
                        if (total > MAX_FILE_BYTES) {
                            target.delete()
                            return null
                        }
                        output.write(buffer, 0, read)
                    }
                }
            }
            if (target.length() == 0L) {
                target.delete()
                null
            } else {
                target
            }
        } catch (error: Exception) {
            target.delete()
            null
        }
    }

    /** The sender's name for the file. Untrusted text; Dart sanitises it. */
    private fun displayName(uri: Uri): String? = try {
        contentResolver.query(uri, null, null, null, null)?.use { cursor ->
            val index = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
            if (index >= 0 && cursor.moveToFirst()) cursor.getString(index) else null
        }
    } catch (error: Exception) {
        null
    }

    /**
     * Sets or clears FLAG_SECURE on this window.
     *
     * What this actually does, so the Dart side can describe it honestly: it
     * asks Android to block screenshots and screen recording of this app, and
     * to show a blank page instead of a live preview in the recent-apps
     * switcher. It is enforced by the window manager, not by Action.
     *
     * What it does not do: it is not a guarantee against a determined party.
     * A second camera pointed at the screen defeats it entirely, and rooted or
     * modified systems can bypass it.
     */
    private fun setSecure(enabled: Boolean): Boolean = try {
        if (enabled) {
            window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
        } else {
            window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
        }
        true
    } catch (error: Exception) {
        false
    }

    /**
     * Opens this app's notification settings, falling back to its app-info
     * page. Returns false rather than throwing when neither can be resolved,
     * so the caller can say so instead of showing a crash.
     */
    private fun openNotificationSettings(): Boolean {
        val notificationSettings = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
            .putExtra(Settings.EXTRA_APP_PACKAGE, packageName)
        if (tryStart(notificationSettings)) return true

        val appDetails = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
            .setData(Uri.fromParts("package", packageName, null))
        return tryStart(appDetails)
    }

    /**
     * The installed build's own version, so About cannot drift out of step
     * with a hand-maintained constant in Dart.
     */
    private fun packageVersion(): Map<String, String>? = try {
        val info = packageManager.getPackageInfo(packageName, 0)
        mapOf(
            "version" to (info.versionName ?: ""),
            "build" to info.longVersionCode.toString(),
        )
    } catch (error: Exception) {
        null
    }

    private fun tryStart(intent: Intent): Boolean = try {
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        startActivity(intent)
        true
    } catch (error: Exception) {
        false
    }

    private companion object {
        /**
         * 25 MB. Above this a share is refused before anything is copied.
         *
         * Chosen against what Action can actually do with the result rather
         * than against what the device could hold: the OCR pipeline normalises
         * images well below this, and a document larger than it would exceed
         * every provider's input limit anyway.
         */
        const val MAX_FILE_BYTES = 25L * 1024 * 1024

        /** Longer than any notice, shorter than a novel. */
        const val MAX_TEXT_CHARS = 200_000

        /** Distinctive enough not to collide with a plugin's own codes. */
        const val PICK_DOCUMENT_REQUEST = 0x4143
    }
}
