import 'package:buzz/buzz.dart';

import '../data/profile_repository.dart';

class ChangeUserNameCommand extends Command {
  ChangeUserNameCommand({required this.newName});

  final String newName;
}

class ChangeUserNameCommandHandler
    extends BuzzEventHandler<ChangeUserNameCommand> {
  ChangeUserNameCommandHandler(this.repository);

  final IProfileRepository repository;

  @override
  void handle(ChangeUserNameCommand event) async {
    if (repository.isLoading) {
      Buzz.fire(OnAccountsIsLoadingEvent());
      return;
    }

    ///TODO: Evaluate usage
    //repository.isLoading(true);

    // Simulate Network latency
    Future.delayed(const Duration(seconds: 2), () async {
      final newName = event.newName;

      try {
        await repository.changeUserName(newName);
        repository.changeUserName(newName);
      } catch (exception) {
        //repository.exception(exception);
      } finally {
        ///TODO: Evaluate usage
        //repository.isLoading(false);
      }

      Buzz.fire(OnAccountsLoadedEvent());
    });
  }
}

class OnAccountsLoadedEvent extends AppEvent {}

class OnAccountsIsLoadingEvent extends AppEvent {}
