import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NavigateToTriviaScoreboard extends NavigateToCommand {
  NavigateToTriviaScoreboard({
    required this.triviaId,
  }) : super(
          directions: NavigationDirections(
            routeBuilder: () => TriviaScoreboardPage.routeName.replaceAll(
              ':trivia_id',
              triviaId,
            ),
          ),
        );

  final String triviaId;
}

class TriviaScoreboardPage extends StatelessWidget {
  static const String routeName = '/trivia/:trivia_id/scoreboard';
  static const String pageName = 'TriviaScoreboardPage';

  const TriviaScoreboardPage({
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
