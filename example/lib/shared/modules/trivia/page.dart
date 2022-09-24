import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'components/copy_join_link_view.dart';
import 'components/trivia_data_view.dart';

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
    String? status = Get.parameters['status'];

    late Widget triviaView;
    if (status == null) {
      triviaView = _TriviaCompleteView(
        triviaId: triviaId,
        onStartPlayTap: onStartPlayTap,
        onSeeScoreboardTap: onSeeScoreboardTap,
        onCopyJoinLinkTap: onCopyJoinLinkTap,
      );
    } else {
      if (status == 'initial') {
        triviaView = _TriviaInitialStatusView(
          triviaId: triviaId,
          onCopyJoinLinkTap: onCopyJoinLinkTap,
        );
      }

      if (status == 'started') {
        triviaView = _TriviaStartedStatusView(
          triviaId: triviaId,
          onStartPlayTap: onStartPlayTap,
          onSeeScoreboardTap: onSeeScoreboardTap,
        );
      }

      if (status == 'finished') {
        triviaView = _TriviaFinishedStatusView(
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
  }) : super(key: key);

  final String triviaId;
  final Function(String) onCopyJoinLinkTap;
  final Function(String) onStartPlayTap;
  final Function(String) onSeeScoreboardTap;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: 3,
      itemBuilder: (_, index) {
        if (index == 0) {
          return _TriviaInitialStatusView(
            triviaId: triviaId,
            onCopyJoinLinkTap: onCopyJoinLinkTap,
          );
        }

        if (index == 1) {
          return _TriviaStartedStatusView(
            triviaId: triviaId,
            onStartPlayTap: onStartPlayTap,
            onSeeScoreboardTap: onSeeScoreboardTap,
          );
        }

        return _TriviaFinishedStatusView(
          triviaId: triviaId,
          onSeeScoreboardTap: onSeeScoreboardTap,
        );
      },
    );
  }
}

class _TriviaInitialStatusView extends StatelessWidget {
  const _TriviaInitialStatusView({
    Key? key,
    required this.triviaId,
    required this.onCopyJoinLinkTap,
  }) : super(key: key);

  final String triviaId;
  final Function(String) onCopyJoinLinkTap;

  @override
  Widget build(BuildContext context) {
    const joinLink = 'TODO: improve joinLink';

    return BaseContainer(
      name: '$runtimeType',
      body: Container(
        color: Colors.red.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            const TriviaDataView(
              hostName: 'hostName',
              triviaName: 'triviaName',
              triviaDescription: 'triviaDescription',
              triviaMainQuestion: 'triviaMainQuestion',
            ),
            CopyJoinLinkView(
              joinLink: joinLink,
              onCopyJoinLinkTap: (joinLink) {
                //TODO: Implement.
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TriviaStartedStatusView extends StatelessWidget {
  const _TriviaStartedStatusView({
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
    return BaseContainer(
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

class _TriviaFinishedStatusView extends StatelessWidget {
  const _TriviaFinishedStatusView({
    Key? key,
    required this.triviaId,
    required this.onSeeScoreboardTap,
  }) : super(key: key);

  final String triviaId;
  final Function(String) onSeeScoreboardTap;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
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
