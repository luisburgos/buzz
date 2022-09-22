import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  static const String pageName = 'HomePage';

  const HomePage({
    Key? key,
    required this.onGoToBuzzTap,
    required this.onNewTriviaGameTap,
  }) : super(key: key);

  final Function() onGoToBuzzTap;
  final Function() onNewTriviaGameTap;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      name: 'Home',
      actions: [
        MainAction(
          label: 'New trivia game',
          onPressed: () {
            debugPrint('$runtimeType onNewTriviaGameTap');
            onNewTriviaGameTap();
          },
        ),
        MainAction(
          label: 'Go to Buzz',
          onPressed: () {
            debugPrint('$runtimeType onGoToBuzzTapped');
            onGoToBuzzTap();
          },
        )
      ],
    );
  }
}
