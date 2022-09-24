import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TriviaFinishedStatusView extends StatelessWidget {
  const TriviaFinishedStatusView({
    Key? key,
    required this.triviaId,
    required this.onSeeScoreboardTap,
  }) : super(key: key);

  final String triviaId;
  final Function(String) onSeeScoreboardTap;

  @override
  Widget build(BuildContext context) {
    return LabeledSection(
      label: 'Finished',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MainActionWidget(
            action: MainAction(
              label: 'See scoreboard',
              onPressed: () {
                debugPrint('$runtimeType onSeeScoreboardTap');
                onSeeScoreboardTap(triviaId);
              },
            ),
          ),
        ],
      ),
    );
  }
}
