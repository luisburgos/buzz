import 'package:buzz/buzz.dart';

abstract class _IModuleBuzzRegistries {
  List<CommandRegistry> get commands;
  List<UiEventRegistry> get uiEvents;
  List<AppEventRegistry> get appEvents;
}

abstract class ModuleBuzzRegistries extends _IModuleBuzzRegistries {
  @override
  List<CommandRegistry> get commands => const [];

  @override
  List<AppEventRegistry> get appEvents => const [];

  @override
  List<UiEventRegistry> get uiEvents => const [];
}

abstract class UiEventRegistry extends EventHandlerRegistry<UiEvent> {
  UiEventRegistry({
    required Function(UiEvent) handler,
  }) : super(handler: handler);
}

abstract class CommandRegistry extends EventHandlerRegistry<Command> {
  CommandRegistry({
    required Function(Command) handler,
  }) : super(handler: handler);
}

abstract class AppEventRegistry extends EventHandlerRegistry<AppEvent> {
  AppEventRegistry({
    required Function(AppEvent) handler,
  }) : super(handler: handler);
}

abstract class EventHandlerRegistry<T> {
  EventHandlerRegistry({
    required this.handler,
  });

  final Function(T) handler;

  dynamic get registryType => T;

  @override
  String toString() => '$runtimeType type:$T';
}
