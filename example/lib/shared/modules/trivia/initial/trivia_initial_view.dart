import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../components/copy_join_link_view.dart';
import '../components/trivia_data_view.dart';

class TriviaInitialStatusView extends StatelessWidget {
  const TriviaInitialStatusView({
    Key? key,
    required this.triviaId,
    required this.joinCode,
    required this.onCopyJoinLinkTap,
  }) : super(key: key);

  final String triviaId;
  final String joinCode;
  final Function(String) onCopyJoinLinkTap;

  @override
  Widget build(BuildContext context) {
    return LabeledSection(
      label: 'Initial',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TriviaDataView(
            hostName: 'hostName',
            triviaName: 'triviaName',
            triviaDescription: 'triviaDescription',
            triviaMainQuestion: 'triviaMainQuestion',
          ),
          const SizedBox(height: 12),
          CopyJoinLinkView(
            joinCode: joinCode,
            onCopyJoinLinkTap: onCopyJoinLinkTap,
          ),
        ],
      ),
    );
  }
}
