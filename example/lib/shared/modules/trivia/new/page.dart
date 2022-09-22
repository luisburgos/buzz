import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

//TODO: Should this be NewTriviaNavigateToCommand?
class NavigateToNewTrivia extends NavigateToCommand {
  NavigateToNewTrivia()
      : super(
          directions: NavigationDirections(
            routeBuilder: () => NewTriviaPage.routeName,
          ),
        );
}

class NewTriviaPage extends StatelessWidget {
  static const String routeName = '/new-trivia';
  static const String pageName = 'NewTriviaPage';

  const NewTriviaPage({
    Key? key,
    required this.onDoneTap,
  }) : super(key: key);

  final Function() onDoneTap;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      name: 'New Trivia',
      actions: [
        MainAction(
          label: 'Done',
          onPressed: () {
            debugPrint('$runtimeType onDoneTap');
            onDoneTap();
          },
        ),
      ],
    );
  }
}
