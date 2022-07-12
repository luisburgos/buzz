import 'package:buzz/buzz.dart';
import 'package:buzz/utils/subtype_checker.dart';
import 'package:event_bus/event_bus.dart';

abstract class TypedEventBus<T> {
  final _eventBus = EventBus();

  bool isTypeSupported<X>() {
    final isSupported = SubtypeChecker<X, T>().isValid();
    print('At $runtimeType, $X isSupported: $isSupported');
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

  void bindRegistries(List<EventHandlerRegistry<T>> registries) {
    for (var registry in registries) {
      bindRegistry(registry);
    }
  }

  void bindRegistry(EventHandlerRegistry<T> registry) {
    final stream = on<T>();
    stream.listen(
      (event) {
        registry.handler(event);
      },
    );
  }
}
