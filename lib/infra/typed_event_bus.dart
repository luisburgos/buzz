import 'package:event_bus/event_bus.dart';

import '../utils.dart';

class TypedEventBus<T> {
  final _eventBus = EventBus();

  bool isTypeSupported(dynamic type) {
    throw UnimplementedError();
  }

  void fire(T event) {
    developerLog('$runtimeType - $event');
    _eventBus.fire(event);
  }

  Stream<X> on<X extends T>() {
    return _eventBus.on<X>();
  }

  /*TODO: Verify use case still valid or remove.
  Stream of(bool Function(dynamic) evaluateCast) {
    return _eventBus.streamController.stream.where(
      (event) {
        final isType = evaluateCast(event);
        //debugPrint('$event isType: $isType');
        return isType;
      },
    ).cast();
  }*/
}

abstract class TypedEventHandler<T> {
  void handle(T event);
}
