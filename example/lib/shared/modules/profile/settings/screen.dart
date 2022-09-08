import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
    required this.mainActionRoute,
  }) : super(key: key);

  final String mainActionRoute;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      SettingsViewController(
        mainActionRoute: mainActionRoute,
      ),
    );

    return Obx(() {
      return BasePage(
        name: 'Profile/Settings',
        body: const Center(
          child: Text('TODO Implement'),
        ),
        action: MainAction(
          label: 'Go to the unknown',
          onPressed: () {
            controller.onMainActionPressed();
          },
        ),
      );
    });
  }
}
