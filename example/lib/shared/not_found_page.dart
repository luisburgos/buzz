import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      name: 'Not Found',
      action: MainAction(
        label: 'Go Home',
        onPressed: () {
          Modular.get<BuzzBase>().fire(
            NavigateBackCommand(),
          );
        },
      ),
    );
  }
}
