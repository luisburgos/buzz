import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigateToTrivia extends NavigateToCommand {
  NavigateToTrivia({
    required this.triviaId,
  }) : super(
          directions: NavigationDirections(
            routeBuilder: () => TriviaPage.routeName.replaceAll(
              ':trivia_id',
              triviaId,
            ),
          ),
        );

  final String triviaId;
}

class TriviaPage extends StatelessWidget {
  static const String routeName = '/trivia/:trivia_id';
  static const String pageName = 'TriviaPage';

  const TriviaPage({
    Key? key,
    required this.onStartPlayTap,
    required this.onSeeScoreboardTap,
  }) : super(key: key);

  final Function(String) onStartPlayTap;
  final Function(String) onSeeScoreboardTap;

  @override
  Widget build(BuildContext context) {
    final triviaId = Get.parameters['trivia_id'] ?? '';

    return BasePage(
      name: '$pageName – $triviaId',
      actions: [
        MainAction(
          label: 'Start play!',
          onPressed: () {
            debugPrint('$runtimeType onStartPlayTap');
            onStartPlayTap(triviaId);
          },
        ),
        MainAction(
          label: 'See scoreboard',
          onPressed: () {
            debugPrint('$runtimeType onSeeScoreboardTap');
            onSeeScoreboardTap(triviaId);
          },
        ),
      ],
    );
  }
}
