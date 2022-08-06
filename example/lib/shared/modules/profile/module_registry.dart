import 'package:buzz/buzz.dart';

import 'commands/change_user_name_command.dart';
import 'data/profile_repository.dart';
import 'presentation/ui_event.dart';

class ProfileModuleRegistries extends BuzzEventHandlersRegistries {
  ProfileModuleRegistries(this.findRepository);

  final IProfileRepository Function() findRepository;

  @override
  List<CommandRegistry> get commands => [
        CommandRegistry<ChangeUserNameCommand>(
          handler: (command) => ChangeUserNameCommandHandler(
            findRepository(),
          ),
        ),
      ];

  @override
  List<UiEventRegistry<UiEvent>> get uiEvents => [
        UiEventRegistry<OnTappedProfiledUiEvent>(
          handler: (event) => GlobalProfileUiEventHandler().handle(event),
        ),
      ];
}
