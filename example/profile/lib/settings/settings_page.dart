import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NamedPage(
      name: 'Profile/Settings',
      action: MainAction(
        label: 'Go to the unknown',
        onPressed: () {
          Buzz.fire(
            NavigateToCommand.named('/asdasd'),
          );
        },
      ),
    );
  }
}
