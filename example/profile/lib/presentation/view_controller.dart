import 'package:buzz/buzz.dart';
import 'package:get/get.dart';
import 'package:profile/data/profile_repository.dart';

import '../model/profile.dart';
import 'ui_event.dart';

class ProfileViewController extends GetxController {
  Rx<Profile> get profile =>
      Get.find<IProfileRepository>().currentProfile?.obs ?? Profile.empty().obs;

  bool get isLoading => Get.find<IProfileRepository>().isLoading;

  void onOptionSelected() {
    Buzz.fire(OnOptionSelected());
  }

  void onChangeNameTapped() {
    Buzz.fire(OnChangeNameTapped());
  }

  void onGoToSettingsTapped() {
    Buzz.fire(OnGoToSettingsTapped());
  }
}
