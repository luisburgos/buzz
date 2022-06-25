import 'package:buzz/buzz.dart';
import 'package:buzz/utils.dart';

//TODO: Evaluate and remove hierarchy with better example
abstract class OnTappedProfiledUiEvent extends OnTapped {}

class OnChangeNameTapped extends OnTappedProfiledUiEvent {}

class OnGoToSettingsTapped extends OnTappedProfiledUiEvent {}

class OnOptionSelected extends OnTappedProfiledUiEvent {}

class GlobalProfileUiEventHandler
    extends TypedEventHandler<OnTappedProfiledUiEvent> {
  @override
  void handle(OnTappedProfiledUiEvent event) {
    developerLog(event.toString());
    if (event is OnChangeNameTapped) {
      /*FindCommandStream().fire(
        ChangeUserNameCommand(newName: 'New name!'),
      );*/
      return;
    }
    if (event is OnGoToSettingsTapped) {
      /*FindCommandStream().fire(
        NavigateToCommand.named(ProfileRoutes.userSettings),
      );
      return;
      */
    }
    if (event is OnOptionSelected) {
      /*FindCommandStream().fire(
        NavigateToCommand.named(ProfileRoutes.userAccounts),
      );*/
    }
  }
}
