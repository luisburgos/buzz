import 'package:buzz/buzz.dart';

import '../commands/change_user_name_command.dart';
import '../routes.dart';

//TODO: Evaluate and remove hierarchy with better example
abstract class OnTappedProfiledUiEvent extends OnTapped {}

class OnChangeNameTapped extends OnTappedProfiledUiEvent {}

class OnGoToSettingsTapped extends OnTappedProfiledUiEvent {}

class OnOptionSelected extends OnTappedProfiledUiEvent {}

class GlobalProfileUiEventHandler
    extends TypedEventHandler<OnTappedProfiledUiEvent> {
  @override
  void handle(OnTappedProfiledUiEvent event) {
    buzzLog('$runtimeType - ${event.toString()}');
    if (event is OnChangeNameTapped) {
      Buzz.fire(
        ChangeUserNameCommand(newName: 'New name!'),
      );
      return;
    }
    if (event is OnGoToSettingsTapped) {
      Buzz.fire(
        NavigateToCommand.named(ProfileRoutes.settings),
      );
    }
    if (event is OnOptionSelected) {
      //TODO: Buzz.fire(NavigateToCommand.named(''));
    }
  }
}
