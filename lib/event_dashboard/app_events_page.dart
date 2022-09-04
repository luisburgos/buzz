import 'package:flutter/material.dart';

import '../buzz.dart';
import 'action_bar/actions_bar_view.dart';
import 'components/dashboard_view_template.dart';
import 'console/console_view.dart';
import 'utils/default_methods.dart';

class DashboardAppEventsPage extends StatelessWidget {
  const DashboardAppEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardViewTemplate(
      actionsBar: const FireEventsActionsView(),
      body: ConsoleView<AppEvent>(
        title: 'App Events',
        tag: 'app_events',
        listeningType: AppEvent,
        streamGenerator: () => Buzz.on<AppEvent>(),
        eventTransformer: (event) {
          return 'APP_ EVENT: $event';
        },
      ),
      onRouteChanged: defaultGoTo,
      onGoToAppTapped: defaultGoToAppTapped,
    );
  }
}
