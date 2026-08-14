/// A success-or-failure wrapper returned across layer boundaries instead of
/// throwing, so callers are forced by the type system to handle failure.
///
/// Extraction is the core of this product and it fails in ordinary ways — bad
/// scans, unreadable documents, no network. Those are expected outcomes, not
/// exceptions, and the UI has to render them rather than crash on them.
sealed class Result<T> {
  const Result();

  /// Whether this holds a value. Prefer pattern matching where you need the
  /// value itself; this is for the cases where you only need the question.
  bool get isOk => this is Ok<T>;
}

final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;
}

final class Err<T> extends Result<T> {
  const Err(this.message, {this.cause});

  /// Shown to the user, so it must be plain language rather than a stack trace.
  final String message;

  /// The underlying error, kept for crash reporting but never displayed.
  final Object? cause;
}
