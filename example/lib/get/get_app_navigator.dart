import 'package:buzz/navigation.dart';
import 'package:get/get.dart';

class GetAppNavigator extends Navigator {
  @override
  void back() {
    Get.back();
  }

  @override
  String get backDefaultRoute => '/';

  @override
  bool canPop() => Get.key.currentState?.canPop() ?? false;

  @override
  void offAndToNamed(String fallback) {
    Get.offAndToNamed(fallback);
  }

  @override
  void toNamed(String path) {
    Get.toNamed(path);
  }
}
