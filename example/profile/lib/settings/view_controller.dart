import 'package:buzz/buzz.dart' show EventRecordsInMemoryStore;
import 'package:core/core.dart';
import 'package:get/get.dart';

class SettingsViewController extends GetxController {
  Stream<List<EventRecord>> get eventsStore =>
      Get.find<EventRecordsInMemoryStore>().listStateChanges();
}
