import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import 'fixtures/app_events.dart';
import 'fixtures/commands.dart';
import 'fixtures/ui_events.dart';
import 'utils/test_helper.dart';

void main() {
  group('Buzz interface', () {
    test('Buzz.cleanBuzz rebuilds instance when calling again', () {
      initDefaultTestBuzz();
      final initialHashCode = Buzz.hashCode;

      expect(Buzz, isNotNull);
      cleanBuzz();
      expect(Buzz, isNotNull);
      expect(Buzz.hashCode == initialHashCode, false);
    });
  });

  group('Only one emit per supported type', () {
    buzzTest(
      'Buzz emits only one UiEvent',
      expectUiEvents: () => [
        isA<UiEvent1>(),
      ],
      fire: () => [
        UiEvent1(),
      ],
    );

    buzzTest(
      'Buzz emits only one AppEvent',
      expectAppEvents: () => [
        isA<AppEvent1>(),
      ],
      fire: () => [
        AppEvent1(),
      ],
    );

    buzzTest(
      'Buzz emits only one Command',
      expectCommands: () => [
        isA<Command1>(),
      ],
      fire: () => [
        Command1(),
      ],
    );
  });

  group('Emits in order', () {
    buzzTest(
      'Buzz alternately emits of each supported type',
      expectUiEvents: () => [
        isA<UiEvent1>(),
        isA<UiEvent2>(),
      ],
      expectAppEvents: () => [
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

    buzzTest(
      'Buzz emits one of each supported type',
      expectUiEvents: () => [
        isA<UiEvent1>(),
      ],
      expectAppEvents: () => [
        isA<AppEvent1>(),
      ],
      expectCommands: () => [
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
