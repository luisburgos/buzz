import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import 'fixtures/app_events.dart';
import 'fixtures/commands.dart';
import 'fixtures/test_helper.dart';
import 'fixtures/ui_events.dart';

void main() {
  group('Buzz interface', () {
    test('Buzz.init updates init flag', () {
      //When
      initDefaultTestBuzz();
      //Then
      expect(Buzz.initDone, true);
    });

    test('Buzz.init set navigator & feedbacksExecutor properly', () {
      //When
      initDefaultTestBuzz();
      //Then
      expect(Buzz.navigator, isNotNull);
      expect(Buzz.feedbacksExecutor, isNotNull);
    });

    /* TODO: Remove comment when cleanBuzz is implemented or removed.
    test('cleanBuzz rebuilds instance when calling again', () {
      //Given
      initDefaultTestBuzz();
      final initialHashCode = Buzz.hashCode;
      expect(Buzz, isNotNull);
      expect(Buzz.navigator, isNotNull);
      expect(Buzz.feedbacksExecutor, isNotNull);
      //When
      cleanBuzz();
      //Then
      expect(Buzz, isNotNull);
      expect(
        () => Buzz.navigator,
        throwsA(
          predicate<Error>(
            (error) => error.toString().contains('LateInitializationError'),
          ),
        ),
      );
      expect(
        () => Buzz.feedbacksExecutor,
        throwsA(
          predicate<Error>(
            (error) => error.toString().contains('LateInitializationError'),
          ),
        ),
      );
      expect(Buzz.hashCode == initialHashCode, false);
      expect(Buzz.initDone, false);
    });
    */

    /* TODO: Evaluate remove tests since all classes are supported.
    test('Buzz.fire throws UnsupportedBuzzMessage ', () {
      expect(
        () => Buzz.fire(NonSupportedClass()),
        throwsA(isA<UnsupportedBuzzMessageType>()),
      );
    });*/
  });

  group('Only one emit per supported type', () {
    buzzTestEmitsInOrder(
      'Buzz emits only one UiEvent',
      expectUiEventsMatchers: () => [
        isA<UiEvent1>(),
      ],
      fire: () => [
        UiEvent1(),
      ],
    );

    buzzTestEmitsInOrder(
      'Buzz emits only one AppEvent',
      expectAppEventsMatchers: () => [
        isA<AppEvent1>(),
      ],
      fire: () => [
        AppEvent1(),
      ],
    );

    buzzTestEmitsInOrder(
      'Buzz emits only one Command',
      expectCommandsMatchers: () => [
        isA<Command1>(),
      ],
      fire: () => [
        Command1(),
      ],
    );
  });

  group('Emits in order', () {
    buzzTestEmitsInOrder(
      'Buzz alternately emits of each supported type',
      expectUiEventsMatchers: () => [
        isA<UiEvent1>(),
        isA<UiEvent2>(),
      ],
      expectAppEventsMatchers: () => [
        isA<AppEvent1>(),
        isA<AppEvent2>(),
      ],
      fire: () => [
        UiEvent1(),
        AppEvent1(),
        UiEvent2(),
        AppEvent2(),
      ],
    );

    buzzTestEmitsInOrder(
      'Buzz emits one of each supported type',
      expectUiEventsMatchers: () => [
        isA<UiEvent1>(),
      ],
      expectAppEventsMatchers: () => [
        isA<AppEvent1>(),
      ],
      expectCommandsMatchers: () => [
        isA<Command1>(),
      ],
      fire: () => [
        UiEvent1(),
        AppEvent1(),
        Command1(),
      ],
    );
  });

  group('Never emits', () {
    ///TODO: Add never emits tests
  });

  group('Never emits UiEvents but emits AppEvents', () {
    ///TODO: Add never emits tests
  });
}
