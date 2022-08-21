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
      String fallback = backDefault;
      //TODO: Watch for duplicated logic. Improve method design.
      fallback = command.preferredBackDefault ?? backDefault;

      if (_canPop()) {
        navigator.back();
      } else {
        navigator.offAndToNamed(fallback);
      }

      Buzz.fire(OnNavigatedBackEvent(fallbackPath: fallback));
      return;
    }

    if (command is NavigateToCommand) {
      final path = command.directions.routeBuilder();
      navigator.toNamed(path);
      print('$runtimeType $path');
      Buzz.fire(OnNavigatedToEvent(path));
    }
  }

  bool _canPop() => navigator.canPop();
}
