import 'package:core/core.dart';
import 'package:example/shared/components/labeled_section.dart';
import 'package:flutter/material.dart';

class CopyJoinLinkView extends StatelessWidget {
  const CopyJoinLinkView({
    Key? key,
    required this.joinLink,
    required this.onCopyJoinLinkTap,
  }) : super(key: key);

  final String joinLink;
  final Function(String) onCopyJoinLinkTap;

  @override
  Widget build(BuildContext context) {
    return LabeledSection(
      label: 'JoinLink',
      backgroundColor: Colors.blueGrey,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(joinLink),
            ),
          ),
          MainActionWidget(
            action: MainAction(
              label: 'Copy!',
              onPressed: () {
                debugPrint('$runtimeType onStartPlayTap');
                onCopyJoinLinkTap(joinLink);
              },
            ),
          ),
        ],
      ),
    );
  }
}
