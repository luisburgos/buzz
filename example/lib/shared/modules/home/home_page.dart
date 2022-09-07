import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.onGoToBuzzTapped,
    required this.onGoToProfileTapped,
  }) : super(key: key);

  final Function() onGoToBuzzTapped;
  final Function() onGoToProfileTapped;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      name: 'Home',
      actions: [
        MainAction(
          label: 'Go to Profile',
          onPressed: () {
            debugPrint('$runtimeType onGoToProfileTapped');
            onGoToProfileTapped();
          },
        ),
        MainAction(
          label: 'Go to Buzz',
          onPressed: () {
            debugPrint('$runtimeType onGoToBuzzTapped');
            onGoToBuzzTapped();
          },
        )
      ],
    );
  }
}
