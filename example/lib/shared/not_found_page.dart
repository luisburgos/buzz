import 'package:buzz/buzz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'named_page.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NamedPage(
      name: 'Not Found',
      action: MainAction(
        label: 'Go Home',
        onPressed: () {
          Modular.get<IBuzzBase>().fire(
            NavigateBackCommand(),
          );
        },
      ),
    );
  }
}
