import 'package:flutter/material.dart';

import '../buzz.dart';
import 'action_bar/actions_bar_view.dart';
import 'components/dashboard_view_template.dart';
import 'console/console_view.dart';
import 'utils/default_methods.dart';

class DashboardUiEventsPage extends StatelessWidget {
  const DashboardUiEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardViewTemplate(
      actionsBar: const FireEventsActionsView(),
      body: ConsoleView<UiEvent>(
        title: 'Ui Events',
        tag: 'ui_events',
        listeningType: UiEvent,
        streamGenerator: () => Buzz.on<UiEvent>(),
        eventTransformer: (event) {
          return 'UI_EVENT: $event';
        },
      ),
      onRouteChanged: defaultGoTo,
      onGoToAppTapped: defaultGoToAppTapped,
    );
  }
}
