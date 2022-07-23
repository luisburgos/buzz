import 'package:buzz/buzz.dart';
import 'package:buzz_ui/in_memory_events_store.dart';
import 'package:get/get.dart';

class SettingsViewController extends GetxController {
  SettingsViewController({
    required this.mainActionRoute,
  });

  final String mainActionRoute;

  Stream<List<EventRecord>> get eventsStore {
    return Get.find<EventRecordsInMemoryStore>().listStateChanges();
  }

  void onDeleteEventsPressed() {}

  void onMainActionPressed() {
    Buzz.fire(
      NavigateToCommand.named(mainActionRoute),
    );
  }
}
