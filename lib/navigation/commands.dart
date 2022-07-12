import '../kinds/commands.dart';

abstract class NavigationCommand extends Command {}

class NavigationDirections {
  NavigationDirections({required this.routeBuilder});

  final String Function() routeBuilder;

  @override
  String toString() {
    return '$runtimeType routeBuilder: $routeBuilder';
  }
}

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
