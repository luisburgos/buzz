import 'package:flutter/material.dart';

import '../named_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.onGoToProfilePressed,
  }) : super(key: key);

  final Function() onGoToProfilePressed;

  @override
  Widget build(BuildContext context) {
    return NamedPage(
      name: 'Home',
      action: MainAction(
        label: 'Go Profile',
        onPressed: () {
          debugPrint('$runtimeType onGoToProfilePressed');
          onGoToProfilePressed();
        },
      ),
    );
  }
}
