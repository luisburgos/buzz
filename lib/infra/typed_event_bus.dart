import 'package:buzz/buzz.dart';
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

  Stream of(dynamic type) {
    return _eventBus.streamController.stream.where(
      (event) {
        final isType = isTypeSupported(type);
        developerLog('$event isType: $isType');
        return isType;
      },
    ).cast();
  }
}

extension TypedEventBusRegistry<T> on TypedEventBus<T> {
  void bindRegistries(List<EventHandlerRegistry<T>> registries) {
    registries.forEach((registry) {
      bindRegistry(registry);
    });
  }

  void bindRegistry(EventHandlerRegistry<T> registry) {
    of(registry.registryType).listen(
      (event) => registry.handler(event),
    );
  }
}

abstract class TypedEventHandler<T> {
  void handle(T event);
}
