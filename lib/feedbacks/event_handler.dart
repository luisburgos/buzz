import '../buzz.dart';

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
      return;
    }

    //TODO: Add more cases
  }
}
