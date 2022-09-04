import '../buzz_impl.dart';
import 'commands.dart';
import 'event_handler.dart';
import 'feedbacks_executor.dart';

class FeedbacksExecutorBuzzRegistry extends BuzzRegistry {
  FeedbacksExecutorBuzzRegistry({
    required this.feedbacksExecutor,
  });

  final FeedbacksExecutor feedbacksExecutor;

  @override
  void register(BuzzBase buzz) {
    buzz.on<FeedbacksCommand>().listen((command) {
      FeedbacksCommandHandler(
        feedbacksExecutor: feedbacksExecutor,
      ).handle(command);
    });
  }
}
