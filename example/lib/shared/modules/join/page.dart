import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'join_view.dart';

class JoinPage extends StatelessWidget {
  static const String routeName = '/join/:join_code';
  static const String pageName = 'JoinPage';

  const JoinPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final joinCode = Get.parameters['join_code'];
    if (joinCode == null) {
      throw UnimplementedError(
        'join_code must not be null',
      );
    }

    return Scaffold(
      body: JoinView(
        joinCode: joinCode,
      ),
    );
  }
}
