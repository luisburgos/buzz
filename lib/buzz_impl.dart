import 'package:buzz/buzz.dart';

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
  void init({
    EventBusFacade? buses,
    required Navigator navigator,
  });

  void destroy();

  EventBusFacade get buses;
  DefaultEventBusFacade? get defaultBuses;
  Navigator get navigator;
}

class BuzzBase implements IBuzzBase {
  @override
  EventBusFacade get buses => _buses;

  @override
  Navigator get navigator => _navigator;

  @override

  ///TODO: Research how to provide default behavior.
  DefaultEventBusFacade? get defaultBuses {
    if (buses is DefaultEventBusFacade) {
      return buses as DefaultEventBusFacade;
    }
    return null;
  }

  late EventBusFacade _buses;
  late Navigator _navigator;

  @override
  void init({
    EventBusFacade? buses,
    required Navigator navigator,
  }) {
    _buses = buses ?? DefaultEventBusFacade();
    _navigator = navigator;

    defaultBuses?.commands.on<NavigationCommand>().listen((navigationCommand) {
      NavigationCommandHandler(
        navigator: _navigator,
        backDefault: _navigator.backDefaultRoute,
      ).handle(navigationCommand);
    });
  }

  @override
  void destroy() {
    //TODO: implement
  }
}
