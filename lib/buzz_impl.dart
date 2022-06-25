import 'package:buzz/buzz.dart';

import 'utils.dart';

IBuzzBase? _buzz;

/// Instance of Modular for search binds and route.
// ignore: non_constant_identifier_names
IBuzzBase get Buzz {
  _buzz ??= BuzzBase();
  return _buzz!;
}

void cleanBuzz() {
  _buzz?.destroy();
  _buzz = null;
}

abstract class IBuzzBase {
  AppEventBus get appEvents;
  CommandEventBus get commands;
  UIEventBus get uiEvents;

  Navigator get navigator;

  void init({
    required Navigator navigator,
  });

  void fire(dynamic event);
  void destroy();
}

class BuzzBase implements IBuzzBase {
  @override
  Navigator get navigator => _navigator;

  @override
  AppEventBus get appEvents => EventBusHolder.of<AppEventBus>();

  @override
  CommandEventBus get commands => EventBusHolder.of<CommandEventBus>();

  @override
  UIEventBus get uiEvents => EventBusHolder.of<UIEventBus>();

  late Navigator _navigator;

  @override
  void init({
    required Navigator navigator,
  }) {
    _navigator = navigator;

    commands.on<NavigationCommand>().listen((navigationCommand) {
      NavigationCommandHandler(
        navigator: _navigator,
        backDefault: _navigator.backDefaultRoute,
      ).handle(navigationCommand);
    });
  }

  @override
  void fire(event) {
    try {
      EventBusHolder.forKind(event).fire(event);
    } catch (e) {
      developerLog('$runtimeType $e');
    }
  }

  @override
  void destroy() {
    //TODO: implement
  }
}
