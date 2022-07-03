import 'package:buzz/buzz.dart';
import 'package:event_bus/event_bus.dart';

import '../utils.dart';

bool isSubtype<S, T>(S s, T t) {
  print('$s is $t? => ${s is T}');
  return s is T;
}

abstract class TypedEventBus<T> {
  final _eventBus = EventBus();

  bool isTypeSupported(dynamic type) {
    final isSupported = isSubtype(type, T);
    print('$runtimeType: $type isSubtype $T = $isSupported');
    return isSupported;
  }

  dynamic get supportedType => T;

  void fire(T event) {
    buzzLog('$runtimeType - $event');
    _eventBus.fire(event);
  }

  Stream<X> on<X extends T>() {
    return _eventBus.on<X>();
  }

  Stream<X> of<X extends T>(dynamic type) {
    return _eventBus.streamController.stream
        .where((e) => isTypeSupported(type))
        .cast<X>();
  }

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
