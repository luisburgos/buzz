import 'package:buzz/buzz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'trivia_view.dart';

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final triviaId = Get.parameters['trivia_id'] ?? '';
    //String? status = Get.parameters['status'];
    /*TriviaStatus triviaStatus = TriviaStatus.initial;
    if (status != null) {
      triviaStatus = TriviaStatus.values.firstWhere(
        (e) => e.toString() == 'TriviaStatus.$status',
      );
    }*/

    return Scaffold(
      appBar: AppBar(
        title: Text('$runtimeType'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TriviaView(
              triviaId: triviaId,
            ),
          ),
        ],
      ),
    );
  }
}

/*
class _TriviaCompleteView extends StatelessWidget {
  const _TriviaCompleteView({
    Key? key,
    required this.triviaId,
    required this.onSeeScoreboardTap,
    required this.onStartPlayTap,
    required this.onGoToStatusTap,
    required this.joinCode,
  }) : super(key: key);

  final String triviaId;
  final String joinCode;
  final Function(String) onStartPlayTap;
  final Function(String) onSeeScoreboardTap;
  final Function(String, String) onGoToStatusTap;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: 4,
      itemBuilder: (_, index) {
        if (index == 0) {
          return TriviaInitialStatusView(
            triviaId: triviaId,
            joinCode: joinCode,
            onCopyJoinLinkTap: onCopyJoinLinkTap,
          );
        }

        if (index == 1) {
          return TriviaStartedStatusView(
            triviaId: triviaId,
            onStartPlayTap: onStartPlayTap,
            onSeeScoreboardTap: onSeeScoreboardTap,
          );
        }

        if (index == 2) {
          return TriviaFinishedStatusView(
            triviaId: triviaId,
            onSeeScoreboardTap: onSeeScoreboardTap,
          );
        }

        return LabeledSection(
          label: 'Page Actions',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainActionWidget(
                action: MainAction(
                  label: 'Go to Initial',
                  onPressed: () {
                    debugPrint('$runtimeType onGoToStatus');
                    onGoToStatusTap(triviaId, 'initial');
                  },
                ),
              ),
              MainActionWidget(
                action: MainAction(
                  label: 'Go to Started',
                  onPressed: () {
                    debugPrint('$runtimeType onGoToStatus');
                    onGoToStatusTap(triviaId, 'started');
                  },
                ),
              ),
              MainActionWidget(
                action: MainAction(
                  label: 'Go to Finished',
                  onPressed: () {
                    debugPrint('$runtimeType onGoToStatus');
                    onGoToStatusTap(triviaId, 'finished');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
*/
