import 'package:buzz/in_memory_events_store.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';

class SettingsViewController extends GetxController {
  Stream<List<EventRecord>> get eventsStore =>
      Get.find<EventRecordsInMemoryStore>().listStateChanges();
}
