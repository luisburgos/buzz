import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../buzz.dart';
import '../../event_dashboard/action_bar/repository.dart';
import 'action_model.dart';
import 'fire_events_action_bar.dart';
import 'overrides.dart';

class FireEventsActionsView extends StatelessWidget {
  const FireEventsActionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      FireEventsActionBarController(),
      tag: 'fire_event_actions',
    );

    return Obx(() {
      final actions = controller.actions;
      return FireEventsActionBar(
        actions: [
          FireEventAction(
            title: 'Fire UiEvent1',
            message: actions.ui.label,
            onFireTap: () => controller.fireUiEvent(),
          ),
          FireEventAction(
            title: 'Fire Command1',
            message: actions.command.label,
            onFireTap: () => controller.fireCommand(),
          ),
          FireEventAction(
            title: 'Fire AppEvent1',
            message: actions.app.label,
            onFireTap: () => controller.fireAppEvent(),
          ),
        ],
      );
    });
  }
}

class FireEventsActionBarController extends GetxController {
  FireActions get actions {
    return Get.find<FireActionsInMemoryRepository>().current.value;
  }

  void fireUiEvent() {
    Buzz.fire(DashboardUiEvent());
  }

  void fireCommand() {
    Buzz.fire(DashboardCommand());
  }

  void fireAppEvent() {
    Buzz.fire(DashboardAppEvent());
  }
}
