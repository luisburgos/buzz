import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import '../fixtures/mock_navigator.dart';
import '../fixtures/test_helper.dart';

void main() {
  _initBuzz() {
    Buzz.init(navigator: MockNavigator());
  }

  group('NavigateToCommand', () {
    buzzTestEmitsInOrder(
      'NavigateToCommand emits OnNavigatedToEvent',
      given: () async {
        _initBuzz();
      },
      expectCommandsMatchers: () => [
        predicate<NavigateToCommand>((command) {
          expect(command.directions.routeBuilder(), '/login');
          return true;
        }),
      ],
      expectAppEventsMatchers: () => [
        predicate<OnNavigatedToEvent>((command) {
          expect(command.path, '/login');
          return true;
        }),
      ],
      fire: () => [
        NavigateToCommand(
          directions: NavigationDirections(routeBuilder: () => '/login'),
        ),
      ],
    );

    buzzTestEmitsInOrder(
      'NavigateToCommand.named emits OnNavigatedToEvent',
      given: () async {
        _initBuzz();
      },
      expectCommandsMatchers: () => [
        predicate<NavigateToCommand>((command) {
          expect(command.directions.routeBuilder(), '/custom');
          return true;
        }),
      ],
      expectAppEventsMatchers: () => [
        predicate<OnNavigatedToEvent>((command) {
          expect(command.path, '/custom');
          return true;
        }),
      ],
      fire: () => [
        NavigateToCommand.named('/custom'),
      ],
    );
  });

  group('NavigateBackCommand', () {
    buzzTestEmitsInOrder(
      'NavigateBackCommand emits OnNavigatedBackEvent '
      'where path is taken from Navigator.backDefaultRoute',
      given: () async {
        _initBuzz();
      },
      expectCommandsMatchers: () => [
        predicate<NavigateBackCommand>((command) {
          expect(command.preferredBackDefault, null);
          return true;
        }),
      ],
      expectAppEventsMatchers: () => [
        predicate<OnNavigatedBackEvent>((command) {
          expect(command.fallbackPath, '/');
          return true;
        }),
      ],
      fire: () => [
        NavigateBackCommand(),
      ],
    );

    buzzTestEmitsInOrder(
      'NavigateBackCommand emits OnNavigatedBackEvent '
      'where path is taken from NavigateBackCommand.preferredBackDefault',
      given: () async {
        _initBuzz();
      },
      expectCommandsMatchers: () => [
        predicate<NavigateBackCommand>((command) {
          expect(command.preferredBackDefault, '/home');
          return true;
        }),
      ],
      expectAppEventsMatchers: () => [
        predicate<OnNavigatedBackEvent>((command) {
          expect(command.fallbackPath, '/home');
          return true;
        }),
      ],
      fire: () => [
        NavigateBackCommand(
          preferredBackDefault: '/home',
        ),
      ],
    );
  });
}
