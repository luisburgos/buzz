import '../buzz_impl.dart';
import '../infra/buzz_event_handler.dart';
import '../kinds/commands.dart';
import 'events.dart';
import 'navigator.dart';

abstract class NavigationCommand extends Command {}

class NavigationDirections {
  NavigationDirections({required this.routeBuilder});

  final String Function() routeBuilder;

  @override
  String toString() {
    return '$runtimeType route: ${routeBuilder()}';
  }
}

class NavigateToCommand extends NavigationCommand {
  NavigateToCommand({required this.directions});

  NavigateToCommand.named(String named)
      : this(
          directions: NavigationDirections(
            routeBuilder: () => named,
          ),
        );

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

class NavigateBackToCommand extends NavigationCommand {
  NavigateBackToCommand({
    required this.directions,
  });

  NavigateBackToCommand.named(String named)
      : this(
          directions: NavigationDirections(
            routeBuilder: () => named,
          ),
        );

  final NavigationDirections directions;
}

class NavigationCommandHandler extends BuzzEventHandler<NavigationCommand> {
  NavigationCommandHandler({
    required this.backDefault,
    required this.navigator,
  });

  final String backDefault;
  final Navigator navigator;

  @override
  //ignore: avoid_renaming_method_parameters
  void handle(NavigationCommand command) {
    if (command is NavigateBackCommand || command is NavigateBackToCommand) {
      if (_canPop()) {
        navigator.back();
        print('OnNavigatedBackEvent(fallbackPath: NULL)');
        Buzz.fire(OnNavigatedBackEvent());
        return;
      }

      String fallback = backDefault;
      if (command is NavigateBackCommand) {
        fallback = command.preferredBackDefault ?? backDefault;
      } else if (command is NavigateBackToCommand) {
        fallback = command.directions.routeBuilder();
      }

      navigator.offAndToNamed(fallback);
      print('OnNavigatedBackEvent(fallbackPath: $fallback)');
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
