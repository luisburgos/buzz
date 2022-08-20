import '../buzz_impl.dart';
import '../infra/typed_event_handler.dart';
import 'commands.dart';
import 'events.dart';
import 'navigator.dart';

class NavigationCommandHandler extends TypedEventHandler<NavigationCommand> {
  NavigationCommandHandler({
    required this.backDefault,
    required this.navigator,
  });

  final String backDefault;
  final Navigator navigator;

  @override
  //ignore: avoid_renaming_method_parameters
  void handle(NavigationCommand command) {
    if (command is NavigateBackCommand) {
      if (_canPop()) {
        navigator.back();
        Buzz.fire(OnNavigatedBackEvent());
        return;
      }

      String fallback = backDefault;
      //TODO: Watch for duplicated logic. Improve method design.
      fallback = command.preferredBackDefault ?? backDefault;
      navigator.offAndToNamed(fallback);
      Buzz.fire(OnNavigatedBackEvent(fallbackPath: fallback));
    }

    if (command is NavigateToCommand) {
      final path = command.directions.routeBuilder();
      navigator.toNamed(path);
      Buzz.fire(OnNavigatedToEvent(path));
    }
  }

  bool _canPop() => navigator.canPop();
}
