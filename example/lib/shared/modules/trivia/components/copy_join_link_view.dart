import 'package:core/core.dart';
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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 51, 204, 255),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
          child: Text(joinLink),
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
    );
  }
}
