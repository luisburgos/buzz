import 'package:buzz/buzz.dart';

class NavigationDirections {
  NavigationDirections({required this.routeBuilder});

  final String Function() routeBuilder;

  @override
  String toString() {
    return '$runtimeType routeBuilder: $routeBuilder';
  }
}

abstract class NavigationCommand extends Command {}

class NavigateToCommand extends NavigationCommand {
  NavigateToCommand.named(String named)
      : this(
          directions: NavigationDirections(
            routeBuilder: () => named,
          ),
        );

  NavigateToCommand({required this.directions});

  final NavigationDirections directions;

  @override
  String toString() {
    return '$runtimeType $directions';
  }
}

class NavigateBackCommand extends NavigationCommand {
  NavigateBackCommand({
    this.preferredBackDefault,
  });

  final String? preferredBackDefault;

  @override
  String toString() {
    return '$runtimeType preferredBackDefault: $preferredBackDefault';
  }
}

class NavigateBackToCommand extends NavigationCommand {}

abstract class Navigator {
  String get backDefaultRoute;

  void back();
  void offAndToNamed(String fallback);
  void toNamed(String path);
  bool canPop();
}

class NavigationCommandHandler extends TypedEventHandler<NavigationCommand> {
  NavigationCommandHandler({
    required this.backDefault,
    required this.navigator,
  });

  final String backDefault;
  final Navigator navigator;

  @override
  //ignore: avoid_renaming_method_parameters
  void handle(NavigationCommand command) {
    if (command is NavigateBackCommand) {
      if (_canPop()) {
        navigator.back();
        Buzz.fire(OnNavigatedBackEvent());
        return;
      }

      final fallback = command.preferredBackDefault ?? backDefault;
      navigator.offAndToNamed(fallback);
      Buzz.fire(OnNavigatedBackEvent(fallbackPath: fallback));
    }

    if (command is NavigateToCommand) {
      final path = command.directions.routeBuilder();
      navigator.toNamed(path);
      Buzz.fire(OnNavigatedToEvent(path));
    }
  }

  bool _canPop() => navigator.canPop();
}

abstract class NavigateEvent extends AppEvent {}

class OnNavigatedToEvent extends NavigateEvent {
  OnNavigatedToEvent(this.path);

  final String path;

  @override
  String toString() {
    return '$runtimeType path: $path';
  }
}

class OnNavigatedBackEvent extends NavigateEvent {
  OnNavigatedBackEvent({
    this.fallbackPath,
  });

  final String? fallbackPath;

  @override
  String toString() {
    return '$runtimeType fallbackPath: $fallbackPath';
  }
}
