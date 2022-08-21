import '../kinds/commands.dart';

abstract class FeedbacksCommand extends Command {}

class ShowSnackBarCommand extends FeedbacksCommand {
  ShowSnackBarCommand(
    this.title, {
    required this.message,
  });

  final String title;
  final String message;
}
