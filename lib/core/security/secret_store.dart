/// Where a user's provider credential lives.
///
/// A port, not an implementation. Two reasons it is worth the indirection:
/// tests must never touch a platform channel, and the storage package is the
/// single most likely dependency in this app to be swapped — the Android side
/// has already moved once, from the now-deprecated Jetpack Security
/// `EncryptedSharedPreferences` to a Keystore-backed cipher over DataStore.
/// Call sites should not have to care when it moves again.
///
/// **The rule this type exists to enforce.** A provider key is written through
/// here and nowhere else. Not SharedPreferences, not the Drift database, not
/// Firestore, not a file Action creates. See `docs/v2/AI_SECURITY_THREAT_MODEL.md`
/// (T1).
library;

/// Keys under which secrets are filed.
///
/// Namespaced per provider so connecting a second provider does not silently
/// overwrite the first, and so removing one leaves the others alone.
abstract final class SecretKeys {
  static const _prefix = 'ai_provider_key';

  static String providerKey(String providerId) => '${_prefix}_$providerId';
}

/// Raised when the platform's secure storage cannot be reached at all.
///
/// Distinct from "no key stored": a device whose Keystore is unavailable is a
/// different situation from a user who has not connected a provider, and the
/// two must not produce the same message.
class SecretStoreUnavailable implements Exception {
  const SecretStoreUnavailable(this.reason);

  final String reason;

  @override
  String toString() => 'SecretStoreUnavailable: $reason';
}

abstract interface class SecretStore {
  /// Stores [value] under [key], replacing anything already there.
  Future<void> write(String key, String value);

  /// Returns the stored secret, or null when nothing is stored.
  Future<String?> read(String key);

  /// Removes the secret. Removing a key that is not present is not an error —
  /// "make sure this is gone" is the useful contract, not "delete exactly one".
  Future<void> delete(String key);

  /// Whether a secret exists, without reading it.
  ///
  /// Settings needs to know a provider is connected on every build. Answering
  /// that by reading the secret would pull it into memory dozens of times for
  /// no reason, so this is a separate question.
  Future<bool> contains(String key);
}

/// An in-memory store.
///
/// Used by tests, and as the fallback when a platform has no secure storage.
/// It is deliberately *not* a persistent fallback: silently downgrading to
/// disk when the Keystore is missing would be exactly the sort of quiet
/// security regression this layer exists to prevent. Nothing here survives the
/// process, which is the honest behaviour.
class InMemorySecretStore implements SecretStore {
  final Map<String, String> _values = {};

  @override
  Future<void> write(String key, String value) async => _values[key] = value;

  @override
  Future<String?> read(String key) async => _values[key];

  @override
  Future<void> delete(String key) async => _values.remove(key);

  @override
  Future<bool> contains(String key) async => _values.containsKey(key);
}
