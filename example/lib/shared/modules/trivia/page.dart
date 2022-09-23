import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigateToTrivia extends NavigateToCommand {
  NavigateToTrivia({
    required this.triviaId,
    this.status,
  }) : super(
          directions: NavigationDirections(
            routeBuilder: () {
              final routeWithId = TriviaPage.routeName.replaceAll(
                ':trivia_id',
                triviaId,
              );
              return '$routeWithId?status=${status ?? 'initial'}';
            },
          ),
        );

  final String triviaId;
  //TODO: Make enum
  String? status;
}

class TriviaPage extends StatelessWidget {
  static const String routeName = '/trivia/:trivia_id';
  static const String pageName = 'TriviaPage';

  const TriviaPage({
    Key? key,
    required this.onStartPlayTap,
    required this.onSeeScoreboardTap,
    required this.onCopyJoinLinkTap,
  }) : super(key: key);

  final Function(String) onStartPlayTap;
  final Function(String) onSeeScoreboardTap;
  final Function(String) onCopyJoinLinkTap;

  @override
  Widget build(BuildContext context) {
    final triviaId = Get.parameters['trivia_id'] ?? '';
    final status = Get.parameters['status'] ?? '';

    if (status == 'finished') {
      return _TriviaFinishedStatusPage(
        triviaId: triviaId,
        onSeeScoreboardTap: onSeeScoreboardTap,
      );
    }

    if (status == 'started') {
      return _TriviaStartedStatusPage(
        triviaId: triviaId,
        onStartPlayTap: onStartPlayTap,
        onSeeScoreboardTap: onSeeScoreboardTap,
      );
    }

    return _TriviaInitialStatusPage(
      triviaId: triviaId,
      onCopyJoinLinkTap: onCopyJoinLinkTap,
    );
  }
}

class _TriviaInitialStatusPage extends StatelessWidget {
  const _TriviaInitialStatusPage({
    Key? key,
    required this.triviaId,
    required this.onCopyJoinLinkTap,
  }) : super(key: key);

  final String triviaId;
  final Function(String) onCopyJoinLinkTap;

  @override
  Widget build(BuildContext context) {
    const joinLink = 'TODO: improve joinLink';

    return BasePage(
      name: '$runtimeType',
      actions: [
        MainAction(
          label: 'Copy!',
          onPressed: () {
            debugPrint('$runtimeType onStartPlayTap');
            onCopyJoinLinkTap(joinLink);
          },
        ),
      ],
    );
  }
}

class _TriviaStartedStatusPage extends StatelessWidget {
  const _TriviaStartedStatusPage({
    Key? key,
    required this.triviaId,
    required this.onStartPlayTap,
    required this.onSeeScoreboardTap,
  }) : super(key: key);

  final String triviaId;
  final Function(String) onStartPlayTap;
  final Function(String) onSeeScoreboardTap;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      name: '$runtimeType',
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

class _TriviaFinishedStatusPage extends StatelessWidget {
  const _TriviaFinishedStatusPage({
    Key? key,
    required this.triviaId,
    required this.onSeeScoreboardTap,
  }) : super(key: key);

  final String triviaId;
  final Function(String) onSeeScoreboardTap;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      name: '$runtimeType',
      actions: [
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
