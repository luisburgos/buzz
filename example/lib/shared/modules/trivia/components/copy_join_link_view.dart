import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' show window;

class CopyJoinLinkView extends StatelessWidget {
  const CopyJoinLinkView({
    Key? key,
    required this.joinCode,
    required this.onCopyJoinLinkTap,
  }) : super(key: key);

  final String joinCode;
  final Function(String) onCopyJoinLinkTap;

  String get joinLink {
    var url = window.location.host;
    return '$url/#/join/$joinCode';
  }

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
