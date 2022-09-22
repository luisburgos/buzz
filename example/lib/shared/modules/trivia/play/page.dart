import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NavigateToTriviaPlay extends NavigateToCommand {
  NavigateToTriviaPlay({
    required this.triviaId,
  }) : super(
          directions: NavigationDirections(
            routeBuilder: () => TriviaPlayPage.routeName.replaceAll(
              ':trivia_id',
              triviaId,
            ),
          ),
        );

  final String triviaId;
}

class TriviaPlayPage extends StatelessWidget {
  static const String routeName = '/trivia/:trivia_id/play';
  static const String pageName = 'TriviaPlayPage';

  const TriviaPlayPage({
    Key? key,
    required this.onNewTriviaGameTap,
  }) : super(key: key);

  final Function() onNewTriviaGameTap;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      name: '$runtimeType',
    );
  }
}
