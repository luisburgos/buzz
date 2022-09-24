import 'package:buzz/buzz.dart';
import 'package:example/shared/modules/trivia/finished/trivia_finished_status_view.dart';
import 'package:example/shared/modules/trivia/initial/trivia_initial_view.dart';
import 'package:example/shared/modules/trivia/started/trivia_started_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'page.dart';
import 'play/page.dart';
import 'scoreboard/page.dart';

class TriviaView extends StatelessWidget {
  const TriviaView({
    Key? key,
    required this.triviaId,
  }) : super(key: key);

  final String triviaId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TriviaViewController());
    return Obx(() {
      final status = controller.status();
      final joinCode = controller.joinCode();

      if (status == TriviaStatus.finished) {
        return TriviaFinishedStatusView(
          triviaId: triviaId,
          onSeeScoreboardTap: controller.onSeeScoreboardTap,
        );
      }

      if (status == TriviaStatus.started) {
        return TriviaStartedStatusView(
          triviaId: triviaId,
          onStartPlayTap: controller.onStartPlayTap,
          onSeeScoreboardTap: controller.onSeeScoreboardTap,
        );
      }

      return TriviaInitialStatusView(
        triviaId: triviaId,
        joinCode: joinCode,
        onCopyJoinLinkTap: controller.onCopyJoinLinkTap,
      );
    });
  }
}

class TriviaViewController extends GetxController {
  Rx<TriviaStatus> status = TriviaStatus.initial.obs;
  Rx<String> joinCode = 'asd-asd1-asd'.obs;

  void copy(String joinLink) async {}

  onStartPlayTap(String triviaId) {
    Buzz.fire(NavigateToTriviaPlay(triviaId: triviaId));
  }

  onSeeScoreboardTap(String triviaId) {
    Buzz.fire(NavigateToTriviaScoreboard(triviaId: triviaId));
  }

  onCopyJoinLinkTap(String joinLink) async {
    await Clipboard.setData(ClipboardData(text: joinLink));
    Get.dialog(const Text('Copied to clipboard'));
  }

  onGoToStatusTap(triviaId, status) {
    Buzz.fire(
      NavigateToTrivia(
        triviaId: triviaId,
        status: status,
      ),
    );
  }
}

enum TriviaStatus {
  initial,
  started,
  finished,
}
