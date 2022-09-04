import '../buzz_impl.dart';
import '../infra/buzz_event_handler.dart';
import 'commands.dart';
import 'events.dart';
import 'feedbacks_executor.dart';

class FeedbacksCommandHandler extends BuzzEventHandler<FeedbacksCommand> {
  FeedbacksCommandHandler({
    required this.feedbacksExecutor,
  });

  final FeedbacksExecutor feedbacksExecutor;

  @override
  //ignore: avoid_renaming_method_parameters
  void handle(FeedbacksCommand command) {
    if (command is ShowSnackBarCommand) {
      feedbacksExecutor.snackBar(command.title, command.message);
      Buzz.fire(OnShowedSnackBarEvent());
      return;
    }

    //TODO: Add more cases
  }
}
