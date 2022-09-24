import 'package:core/core.dart';
import 'package:example/shared/components/labeled_section.dart';
import 'package:flutter/material.dart';

class TriviaStartedStatusView extends StatelessWidget {
  const TriviaStartedStatusView({
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
    return LabeledSection(
      label: 'Started',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MainActionWidget(
            action: MainAction(
              label: 'Start play!',
              onPressed: () {
                debugPrint('$runtimeType onStartPlayTap');
                onStartPlayTap(triviaId);
              },
            ),
          ),
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
