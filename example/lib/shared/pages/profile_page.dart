import 'package:flutter/material.dart';

import '../named_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
    required this.onBackToHomePressed,
  }) : super(key: key);

  final Function() onBackToHomePressed;

  @override
  Widget build(BuildContext context) {
    return NamedPage(
      name: 'Profile',
      action: MainAction(
        label: 'Back to Home',
        onPressed: () {
          debugPrint('onBackToHomePressed');
          onBackToHomePressed();
        },
      ),
    );
  }
}
