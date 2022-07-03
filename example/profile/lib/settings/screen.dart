import 'package:buzz/buzz.dart';
import 'package:buzz_ui/events_list_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsViewController());

    return Obx(() {
      return BasePage(
        name: 'Profile/Settings',
        body: EventRecordsView(
          eventsStoreStream: controller.eventsStore,
        ),
        action: MainAction(
          label: 'Go to the unknown',
          onPressed: () {
            Buzz.fire(
              NavigateToCommand.named('/asdasd'),
            );
          },
        ),
      );
    });
  }
}
