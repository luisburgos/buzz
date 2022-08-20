import 'package:flutter/foundation.dart';

import 'typed_event_handler.dart';

abstract class IBuzzEventHandlersRegistries {
  List<EventHandlerRegistry> get commands;
  List<EventHandlerRegistry> get uiEvents;
  List<EventHandlerRegistry> get appEvents;
}

abstract class BuzzEventHandlersRegistries
    extends IBuzzEventHandlersRegistries {
  @override
  List<EventHandlerRegistry> get commands => const [];

  @override
  List<EventHandlerRegistry> get appEvents => const [];

  @override
  List<EventHandlerRegistry> get uiEvents => const [];
}

class EventHandlerRegistry<T> {
  EventHandlerRegistry(this.eventHandler);

  final TypedEventHandler<T> eventHandler;

  dynamic get registryType => T;

  bool isSupportedType(dynamic x) {
    final isSupported = x is T;
    debugPrint('At $runtimeType, $x isSupported: $isSupported');
    return isSupported;
  }

  @override
  String toString() => '$runtimeType type: $T handler: $eventHandler';
}
