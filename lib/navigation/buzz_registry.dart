import '../buzz_impl.dart';
import 'commands.dart';
import 'navigator.dart';

class NavigationBuzzRegistry extends BuzzRegistry {
  NavigationBuzzRegistry({required this.navigator, required this.backDefault});

  final String backDefault;
  final Navigator navigator;

  @override
  void register(BuzzBase buzz) {
    buzz.on<NavigationCommand>().listen((command) {
      NavigationCommandHandler(
        backDefault: backDefault,
        navigator: navigator,
      ).handle(command);
    });
  }
}
