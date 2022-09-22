import 'package:core/core.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  static const String routeName = '/join/join_code';
  static const String pageName = 'JoinPage';

  const JoinPage({
    Key? key,
    required this.onNewTriviaGameTap,
  }) : super(key: key);

  final Function() onNewTriviaGameTap;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      name: '$runtimeType',
      actions: [
        MainAction(
          label: 'New trivia game',
          onPressed: () {
            debugPrint('$runtimeType onNewTriviaGameTap');
            onNewTriviaGameTap();
          },
        ),
      ],
    );
  }
}
