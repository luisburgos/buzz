import 'package:flutter/material.dart';

import '../buzz.dart';
import 'action_bar/actions_bar_view.dart';
import 'components/dashboard_view_template.dart';
import 'console/console_view.dart';
import 'utils/default_methods.dart';

class DashboardCommandsPage extends StatelessWidget {
  const DashboardCommandsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardViewTemplate(
      actionsBar: const FireEventsActionsView(),
      body: ConsoleView<Command>(
        title: 'Commands',
        tag: 'commands',
        listeningType: Command,
        streamGenerator: () => Buzz.on<Command>(),
        eventTransformer: (event) {
          return 'COMMAND: $event';
        },
      ),
      onRouteChanged: defaultGoTo,
      onGoToAppTapped: defaultGoToAppTapped,
    );
  }
}
