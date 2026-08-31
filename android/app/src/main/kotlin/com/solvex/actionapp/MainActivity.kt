package com.solvex.actionapp

import android.content.Intent
import android.net.Uri
import android.provider.Settings
import android.view.WindowManager
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * Adds the few capabilities Flutter has no way to reach on its own.
 *
 * **Why FlutterFragmentActivity rather than FlutterActivity.** App Lock uses
 * androidx BiometricPrompt through `local_auth`, and BiometricPrompt can only
 * be shown from a FragmentActivity — it needs a FragmentManager to host its
 * dialog. This is the base class `local_auth` documents, and it is a superset
 * of what the app previously used: FlutterFragmentActivity extends
 * FragmentActivity and provides the same Flutter embedding.
 *
 * The two channels below are here for the same reason as each other: a whole
 * dependency for a single system call is a worse trade than a few lines of
 * Kotlin.
 */
class MainActivity : FlutterFragmentActivity() {
    private val settingsChannel = "com.solvex.actionapp/system_settings"
    private val privacyChannel = "com.solvex.actionapp/screen_privacy"

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
     * modified systems can bypass it. The Security Centre says so rather than
     * calling this "screenshot protection" and leaving the user to assume more
     * than is true.
     *
     * Must run on the UI thread — a window flag set from any other thread
     * throws — and the channel handler is already there.
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
}
