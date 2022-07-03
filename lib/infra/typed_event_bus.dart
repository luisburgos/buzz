import 'package:buzz/buzz.dart';
import 'package:event_bus/event_bus.dart';

import '../utils.dart';

class TypedEventBus<T> {
  final _eventBus = EventBus();

  bool isTypeSupported(Object type) {
    throw UnimplementedError();
  }

  void fire(T event) {
    buzzLog('$runtimeType - $event');
    _eventBus.fire(event);
  }

  Stream<X> on<X extends T>() {
    return _eventBus.on<X>();
  }

  Stream<X> of<X extends T>(dynamic type) {
    return _eventBus.streamController.stream
        .where((e) => isTypeSupported(e))
        .cast<X>();
  }
}

extension TypedEventBusRegistry<T> on TypedEventBus<T> {
  void bindRegistries(List<EventHandlerRegistry<T>> registries) {
    registries.forEach((registry) {
      bindRegistry(registry);
    });
  }

  void bindRegistry(EventHandlerRegistry<T> registry) {
    final stream = of<T>(registry.registryType);
    buzzLog('bindRegistry: $T - registry: ${registry}');
    buzzLog('bindRegistry: $T - stream: ${stream.toString()}');
    stream.listen(
      (event) {
        registry.handler(event);
      },
    );
  }
}

abstract class TypedEventHandler<T> {
  void handle(T event);
}
