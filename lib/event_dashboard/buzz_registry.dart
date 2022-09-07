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
    Get.put<FireActionsInMemoryRepository>(FireActionsInMemoryRepository());

    buzz.on<UiEvent>().listen((event) {
      FireActionsInMemoryRepository.to.save(
        'ui',
        ConsoleEntry('$event'),
      );
    });

    buzz.on<Command>().listen((event) {
      FireActionsInMemoryRepository.to.save(
        'command',
        ConsoleEntry('$event'),
      );
    });

    buzz.on<AppEvent>().listen((event) {
      FireActionsInMemoryRepository.to.save(
        'app',
        ConsoleEntry('$event'),
      );
    });

    buzz.on<GoToDashboardPageUiEvent>().listen((event) {
      //TODO: Should we use buzz instead of Buzz here?
      Buzz.fire(NavigateToCommand.named(event.route ?? ''));
    });

    buzz.on<GoToAppTappedUiEvent>().listen((_) {
      Buzz.fire(NavigateToCommand.named(mainAppRoute));
    });
  }
}
