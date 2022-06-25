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
  String toString() => '$runtimeType type:$T';
}
