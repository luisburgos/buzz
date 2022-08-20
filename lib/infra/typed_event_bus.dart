import 'dart:async';

import 'package:buzz/buzz.dart';
import 'package:buzz/utils/subtype_checker.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';

abstract class TypedEventBus<T> {
  @visibleForTesting
  StreamController get eventBusStreamController => _eventBus.streamController;

  @visibleForTesting
  Stream get eventBusStream => eventBusStreamController.stream;

  final _eventBus = EventBus();

  bool isTypeSupported<X>() {
    final isSupported = SubtypeChecker<X, T>().isValid();
    print('At $runtimeType, $X isSupported: $isSupported');
    return isSupported;
  }

  dynamic get supportedType => T;

  void fire(T event) {
    print('$runtimeType - $event');
    _eventBus.fire(event);
  }

  Stream on<X>() {
    return _eventBus.on<X>();
  }

  Future<void> bindRegistries(List<EventHandlerRegistry> registries) async {
    return Future.microtask(() {
      for (var registry in registries) {
        bindRegistry(registry);
      }
    });
  }

  StreamSubscription bindRegistry(EventHandlerRegistry registry) {
    final stream = on<T>().where(
      (event) {
        debugPrint('bindRegistry: $event - $registry');
        return registry.isSupportedType(event);
      },
    );
    return stream.listen(
      (event) {
        registry.eventHandler.handle(event);
      },
    );
  }
}
