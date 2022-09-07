class BuzzTypedEventBusForTypeNotFound extends BuzzError {
  BuzzTypedEventBusForTypeNotFound(
    String type, [
    StackTrace? stackTrace,
  ]) : super('EventBus for $type not found', stackTrace);
}

class UnsupportedBuzzMessageType extends BuzzError {
  UnsupportedBuzzMessageType(
    dynamic message, [
    StackTrace? stackTrace,
  ]) : super('$message type is not supported', stackTrace);
}

//TODO: Should be abstract?
class BuzzError implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const BuzzError(this.message, [this.stackTrace]);

  String _returnStackTrace() =>
      stackTrace != null ? '\n${stackTrace.toString()}' : '';

  @override
  String toString() => '$message${_returnStackTrace()}';
}
