import '../kinds/commands.dart';

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
  NavigateToCommand({
    required this.directions,
  });

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
