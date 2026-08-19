package com.solvex.actionapp

import android.content.Intent
import android.net.Uri
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * Adds one capability Flutter has no way to reach on its own: sending the user
 * to this app's own settings page.
 *
 * Notification permission is the one setting the app can lose and never get
 * back by asking — once Android has stopped showing the runtime dialog, the
 * only remaining route is system settings. Telling someone "turn it on in
 * Settings" without taking them there is the kind of dead end this product is
 * supposed to avoid, and a whole dependency for a single Intent is a worse
 * trade than fifteen lines here.
 */
class MainActivity : FlutterActivity() {
    private val channelName = "com.solvex.actionapp/system_settings"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "openNotificationSettings" -> result.success(openNotificationSettings())
                "packageVersion" -> result.success(packageVersion())
                else -> result.notImplemented()
            }
        }
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
