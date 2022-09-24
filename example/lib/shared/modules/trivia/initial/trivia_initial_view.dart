import 'package:flutter/material.dart';

import '../../../components/labeled_section.dart';
import '../components/copy_join_link_view.dart';
import '../components/trivia_data_view.dart';

class TriviaInitialStatusView extends StatelessWidget {
  const TriviaInitialStatusView({
    Key? key,
    required this.triviaId,
    required this.onCopyJoinLinkTap,
  }) : super(key: key);

  final String triviaId;
  final Function(String) onCopyJoinLinkTap;

  @override
  Widget build(BuildContext context) {
    const joinLink = 'TODO: improve joinLink';

    return LabeledSection(
      label: 'Initial',
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
    );
  }
}
