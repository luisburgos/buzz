import 'package:get/get.dart';

import '../console/console_entries_view.dart';
import 'action_model.dart';

class FireActionsInMemoryRepository {
  Rx<FireActions> current = FireActions().obs;

  static FireActionsInMemoryRepository get to => Get.find();

  void save(String tag, ConsoleEntry eventData) {
    current.update((val) {
      val?.addEvent(tag, eventData);
      val?.setLabel(
        tag,
        'fired [${current.value.actionFor(tag).count}]',
      );
    });
  }
}
