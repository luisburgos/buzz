import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import '../fixtures/navigator.dart';
import '../utils/test_helper.dart';

void main() {
  group('Buzz events', () {
    _initBuzz() {
      Buzz.init(navigator: MockNavigator());
    }

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
      'NavigateBackCommand emits OnNavigatedBackEvent',
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
