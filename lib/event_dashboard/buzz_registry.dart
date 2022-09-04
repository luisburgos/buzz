import 'package:get/get.dart';

import '../buzz_impl.dart';
import '../event_dashboard/ui_events.dart';
import '../kinds/app_events.dart';
import '../kinds/commands.dart';
import '../kinds/ui_events.dart';
import '../navigation/commands.dart';
import 'action_bar/repository.dart';
import 'console/console_entries_view.dart';

class EventsDashboardBuzzRegistry extends BuzzRegistry {
  EventsDashboardBuzzRegistry({
    required this.mainAppRoute,
  });

  final String mainAppRoute;

  @override
  void register(BuzzBase buzz) {
    buzz.on<UiEvent>().listen((event) {
      Get.find<FireActionsInMemoryRepository>().save(
        'ui',
        ConsoleEntry('$event'),
      );
    });

    buzz.on<Command>().listen((event) {
      Get.find<FireActionsInMemoryRepository>().save(
        'command',
        ConsoleEntry('$event'),
      );
    });

    buzz.on<AppEvent>().listen((event) {
      Get.find<FireActionsInMemoryRepository>().save(
        'app',
        ConsoleEntry('$event'),
      );
    });

    buzz.on<GoToDashboardPageUiEvent>().listen((event) {
      Buzz.fire(NavigateToCommand.named(event.route ?? ''));
    });

    buzz.on<GoToAppTappedUiEvent>().listen((_) {
      buzz.fire(NavigateToCommand.named(mainAppRoute));
    });
  }
}
