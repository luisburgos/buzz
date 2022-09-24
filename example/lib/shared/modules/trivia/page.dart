import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:example/shared/components/labeled_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'finished/trivia_finished_status_view.dart';
import 'initial/trivia_initial_view.dart';
import 'started/trivia_started_view.dart';

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
    required this.onGoToStatusTap,
  }) : super(key: key);

  final Function(String) onStartPlayTap;
  final Function(String) onSeeScoreboardTap;
  final Function(String) onCopyJoinLinkTap;
  final Function(String, String) onGoToStatusTap;

  @override
  Widget build(BuildContext context) {
    final triviaId = Get.parameters['trivia_id'] ?? '';
    String? status = Get.parameters['status'];

    late Widget triviaView;
    if (status == null) {
      triviaView = _TriviaCompleteView(
        triviaId: triviaId,
        onStartPlayTap: onStartPlayTap,
        onSeeScoreboardTap: onSeeScoreboardTap,
        onCopyJoinLinkTap: onCopyJoinLinkTap,
        onGoToStatusTap: onGoToStatusTap,
      );
    } else {
      if (status == 'initial') {
        triviaView = TriviaInitialStatusView(
          triviaId: triviaId,
          onCopyJoinLinkTap: onCopyJoinLinkTap,
        );
      }

      if (status == 'started') {
        triviaView = TriviaStartedStatusView(
          triviaId: triviaId,
          onStartPlayTap: onStartPlayTap,
          onSeeScoreboardTap: onSeeScoreboardTap,
        );
      }

      if (status == 'finished') {
        triviaView = TriviaFinishedStatusView(
          triviaId: triviaId,
          onSeeScoreboardTap: onSeeScoreboardTap,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$runtimeType'),
      ),
      body: Column(
        children: [
          Expanded(child: triviaView),
        ],
      ),
    );
  }
}

class _TriviaCompleteView extends StatelessWidget {
  const _TriviaCompleteView({
    Key? key,
    required this.triviaId,
    required this.onCopyJoinLinkTap,
    required this.onSeeScoreboardTap,
    required this.onStartPlayTap,
    required this.onGoToStatusTap,
  }) : super(key: key);

  final String triviaId;
  final Function(String) onCopyJoinLinkTap;
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
