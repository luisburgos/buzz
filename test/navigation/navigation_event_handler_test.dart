import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';
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

  group('Navigator called from NavigationCommandHandler', () {
    MockNavigator mockNavigator = MockNavigator();

    test(
      'Navigator.toNamed is called for NavigateToCommand',
      () {
        final testNavigationCommandHandler = NavigationCommandHandler(
          navigator: mockNavigator,
          backDefault: '/',
        );

        when(mockNavigator.toNamed('/login')).thenAnswer((_) {});

        testNavigationCommandHandler.handle(
          NavigateToCommand(
            directions: NavigationDirections(
              routeBuilder: () => '/login',
            ),
          ),
        );

        verify(mockNavigator.toNamed('/login')).called(1);
      },
    );

    test(
      'Navigator.back is called for NavigateBackCommand',
      () {
        final testNavigationCommandHandler = NavigationCommandHandler(
          navigator: mockNavigator,
          backDefault: '/',
        );

        when(mockNavigator.back()).thenAnswer((_) {});

        testNavigationCommandHandler.handle(
          NavigateBackCommand(
            preferredBackDefault: '/home',
          ),
        );

        verify(mockNavigator.back()).called(1);
      },
    );

    test(
      'Navigator.offAndToNamed is called for NavigateBackCommand when canPop is false',
      () {
        final testNavigationCommandHandler = NavigationCommandHandler(
          navigator: mockNavigator,
          backDefault: '/',
        );

        when(mockNavigator.canPop()).thenAnswer((_) => false);
        when(mockNavigator.offAndToNamed('/home')).thenAnswer((_) {});

        testNavigationCommandHandler.handle(
          NavigateBackCommand(
            preferredBackDefault: '/home',
          ),
        );

        verify(mockNavigator.offAndToNamed('/home')).called(1);
      },
    );
  });
}
