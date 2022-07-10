class BuzzChannelNotFound extends BuzzError {
  BuzzChannelNotFound(String message) : super(message);
}

class UnsupportedBuzzMessage extends BuzzError {
  UnsupportedBuzzMessage(dynamic message) : super('$message is not supported');
}

abstract class BuzzError implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const BuzzError(this.message, [this.stackTrace]);

  String _returnStackTrace() =>
      stackTrace != null ? '\n${stackTrace.toString()}' : '';

  @override
  String toString() => '$runtimeType: $message${_returnStackTrace()}';
}
