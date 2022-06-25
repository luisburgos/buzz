import 'package:buzz/buzz.dart';
import 'package:profile/data/profile_repository.dart';
import 'package:profile/presentation/ui_event.dart';

import 'commands/change_user_name_command.dart';

class ProfileModuleRegistries extends ModuleBuzzRegistries {
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
