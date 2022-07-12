import 'package:buzz/buzz.dart';
import 'package:buzz/utils.dart';

abstract class FeedbacksExecutor {
  void snackBar(String title, String message);
}

class DefaultFeedbacksExecutor extends FeedbacksExecutor {
  @override
  void snackBar(String title, String message) {
    buzzLog('$title:$message');
  }
}

abstract class FeedbacksCommand extends Command {}

class ShowSnackBarCommand extends FeedbacksCommand {
  ShowSnackBarCommand(
    this.title, {
    required this.message,
  });

  final String title;
  final String message;
}

class FeedbacksCommandHandler extends TypedEventHandler<FeedbacksCommand> {
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
    }

    //TODO: Add more cases
  }
}

class OnShowedSnackBarEvent extends AppEvent {}
