import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import '../fixtures/mock_navigator.dart';
import '../fixtures/test_helper.dart';

void main() {
  _initBuzz({
    bool mockCanPop = true,
  }) {
    Buzz.init(
      navigator: MockNavigator(mockCanPop: mockCanPop),
    );
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
        predicate<OnNavigatedToEvent>((event) {
          expect(event.path, '/login');
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
        predicate<OnNavigatedToEvent>((event) {
          expect(event.path, '/custom');
          return true;
        }),
      ],
      fire: () => [
        NavigateToCommand.named('/custom'),
      ],
    );
  });

  group('NavigateBackCommand', () {
    /*FIXME: asynchronous gap error
    buzzTestEmitsInOrder(
      'NavigateBackCommand emits OnNavigatedBackEvent '
      'where path is taken from Navigator.backDefaultRoute',
      given: () async {
        _initBuzz(mockCanPop: false);
      },
      expectCommandsMatchers: () => [
        predicate<NavigateBackCommand>((command) {
          expect(command.preferredBackDefault, null);
          return true;
        }),
      ],
      expectAppEventsMatchers: () => [
        predicate<OnNavigatedBackEvent>((event) {
          expect(event.fallbackPath, '/');
          return true;
        }),
      ],
      fire: () => [
        NavigateBackCommand(),
      ],
    );
     */

    /*FIXME: asynchronous gap error
    buzzTestEmitsInOrder(
      'NavigateBackCommand emits OnNavigatedBackEvent '
      'where path is taken from NavigateBackCommand.preferredBackDefault',
      given: () async {
        _initBuzz(mockCanPop: false);
      },
      expectCommandsMatchers: () => [
        predicate<NavigateBackCommand>((command) {
          expect(command.preferredBackDefault, '/home');
          return true;
        }),
      ],
      expectAppEventsMatchers: () => [
        predicate<OnNavigatedBackEvent>((event) {
          print('expectAppEventsMatchers: $event');
          expect(event.fallbackPath, '/home');
          return true;
        }),
      ],
      fire: () => [
        NavigateBackCommand(
          preferredBackDefault: '/home',
        ),
      ],
    );
     */
  });
}
