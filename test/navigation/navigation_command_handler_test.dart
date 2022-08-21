import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../fixtures/navigator.dart';

void main() {
  group('Navigator called from NavigationCommandHandler', () {
    MockNavigator mockNavigator = MockNavigator();

    test(
      'Navigator.toNamed is called for NavigateToCommand',
      () {
        final testNavigationCommandHandler = NavigationCommandHandler(
          navigator: mockNavigator,
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
