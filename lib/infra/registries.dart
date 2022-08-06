import 'package:buzz/buzz.dart';

abstract class IBuzzDataRegistries {
  List<DataRegistry> get registries;
}

abstract class BuzzDataRegistries extends IBuzzDataRegistries {}

class DataRegistry<T> {
  DataRegistry({
    required this.binder,
  });

  final Function(T) binder;
  dynamic get registryType => T;

  @override
  String toString() => '$runtimeType type: $T handler: $binder';
}

abstract class IBuzzEventHandlersRegistries {
  List<CommandRegistry> get commands;
  List<UiEventRegistry> get uiEvents;
  List<AppEventRegistry> get appEvents;
}

abstract class BuzzEventHandlersRegistries
    extends IBuzzEventHandlersRegistries {
  @override
  List<CommandRegistry> get commands => const [];

  @override
  List<AppEventRegistry> get appEvents => const [];

  @override
  List<UiEventRegistry> get uiEvents => const [];
}

class UiEventRegistry<U extends UiEvent> extends EventHandlerRegistry<U> {
  UiEventRegistry({
    required Function(U) handler,
  }) : super(handler: handler);
}

class CommandRegistry<C extends Command> extends EventHandlerRegistry<C> {
  CommandRegistry({
    required Function(C) handler,
  }) : super(handler: handler);
}

class AppEventRegistry<A extends AppEvent> extends EventHandlerRegistry<A> {
  AppEventRegistry({
    required Function(A) handler,
  }) : super(handler: handler);
}

abstract class EventHandlerRegistry<T> {
  EventHandlerRegistry({
    required this.handler,
  });

  final Function(T) handler;
  dynamic get registryType => T;

  @override
  String toString() => '$runtimeType type: $T handler: $handler';
}
