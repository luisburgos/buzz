import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

class SettingsViewController extends GetxController {
  SettingsViewController({
    required this.mainActionRoute,
  });

  final String mainActionRoute;

  void onDeleteEventsPressed() {}

  void onMainActionPressed() {
    Buzz.fire(
      NavigateToCommand.named(mainActionRoute),
    );
  }
}
