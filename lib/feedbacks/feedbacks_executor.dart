import 'package:buzz/buzz.dart';

abstract class FeedbacksExecutor {
  void snackBar(String title, String message);
}

class DefaultFeedbacksExecutor extends FeedbacksExecutor {
  @override
  void snackBar(String title, String message) {
    buzzLog('$title - $message');
  }
}
