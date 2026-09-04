/// [SecretStore] backed by the operating system.
///
/// Android uses a Keystore-held key (hardware-backed where the device provides
/// one); iOS uses the Keychain. Nothing here writes to SharedPreferences, the
/// Drift database, or any file Action creates.
///
/// **On the Android options.** `EncryptedSharedPreferences` is deliberately not
/// requested: Google deprecated the Jetpack Security library beneath it, and
/// current versions of the plugin ignore the flag anyway in favour of a
/// Keystore-backed cipher over DataStore, migrating existing values across. Not
/// passing it is the correct call rather than an omission.
///
/// **On what this can promise.** OS-backed storage is a meaningful obstacle on
/// a compromised or rooted device, not an absolute one. Nothing in the app's
/// copy may claim a key cannot be extracted. See
/// `docs/v2/AI_SECURITY_THREAT_MODEL.md` (T1).
library;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/security/secret_store.dart';

class PlatformSecretStore implements SecretStore {
  PlatformSecretStore({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(),
              iOptions: IOSOptions(
                // The key is needed while the user is in the app running a
                // tool, never in the background, so the strictest accessibility
                // level that still survives a device restart is right. It also
                // keeps the value out of an unencrypted iCloud backup.
                accessibility: KeychainAccessibility.first_unlock_this_device,
              ),
            );

  final FlutterSecureStorage _storage;

  @override
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } on Object catch (error) {
      // Surfaced rather than swallowed. A silent failure here would leave the
      // user believing a key was saved that was not, and the next tool run
      // would report "not configured" for no visible reason.
      throw SecretStoreUnavailable(error.toString());
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } on Object {
      // A read failure reads as "no key stored", which is recoverable: the user
      // is shown the connect invitation and can re-enter it. Throwing here
      // would instead break every screen that merely asks whether AI is set up.
      return null;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } on Object {
      // "Make sure this is gone" is the contract. A platform that says the key
      // was already absent is a success, not a failure to report.
    }
  }

  @override
  Future<bool> contains(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } on Object {
      return false;
    }
  }
}
