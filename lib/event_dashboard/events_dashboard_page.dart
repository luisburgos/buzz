import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../buzz.dart';
import 'action_bar/actions_bar_view.dart';
import 'components/dashboard_view_template.dart';
import 'console/console_view.dart';
import 'utils/default_methods.dart';

class GoToBuzzEventsDashboard extends NavigateToCommand {
  GoToBuzzEventsDashboard()
      : super(
          directions: NavigationDirections(
            routeBuilder: () => EventsDashboardPage.routeName,
          ),
        );
}

class EventsDashboardPage extends StatelessWidget {
  static String routeName = '/buzz';

  const EventsDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardViewTemplate(
      actionsBar: const FireEventsActionsView(),
      body: Builder(
        builder: (_) {
          return Obx(() {
            final controller = Get.find<DashboardController>(
              tag: 'event_dashboard',
            );

            switch (controller.currentIndex()) {
              case 1:
                return ConsoleView<Command>(
                  title: 'Commands',
                  tag: 'commands',
                  listeningType: Command,
                  streamGenerator: () => Buzz.on<Command>(),
                  eventTransformer: (event) {
                    return 'COMMAND: $event';
                  },
                );
              case 2:
                return ConsoleView<AppEvent>(
                  title: 'App Events',
                  tag: 'app_events',
                  listeningType: AppEvent,
                  streamGenerator: () => Buzz.on<AppEvent>(),
                  eventTransformer: (event) {
                    return 'APP_ EVENT: $event';
                  },
                );
              default:
                return ConsoleView<UiEvent>(
                  title: 'Ui Events',
                  tag: 'ui_events',
                  listeningType: UiEvent,
                  streamGenerator: () => Buzz.on<UiEvent>(),
                  eventTransformer: (event) {
                    return 'UI_EVENT: $event';
                  },
                );
            }
          });
        },
      ),
      onRouteChanged: defaultGoTo,
      onGoToAppTapped: defaultGoToAppTapped,
    );
  }
}
