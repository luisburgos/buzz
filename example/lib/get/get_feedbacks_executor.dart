import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

class GetFeedbacksExecutor extends FeedbacksExecutor {
  @override
  void snackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}
