import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'helpers/test_events.dart';

class MockNavigator extends Mock implements Navigator {}

void main() {
  test('Buzz emits AppEvents and UiEvents', () {
    //Given
    Buzz.init(
      navigator: MockNavigator(),
    );

    //Then
    expectLater(
      Buzz.appEvents.on(),
      emitsInAnyOrder([
        isA<AppEvent1>(),
        isA<AppEvent2>(),
      ]),
    );

    expectLater(
      Buzz.uiEvents.on(),
      emitsInAnyOrder([
        isA<UiEvent1>(),
        isA<UiEvent2>(),
      ]),
    );

    //When
    Buzz
      ..fire(AppEvent1())
      ..fire(UiEvent1())
      ..fire(AppEvent2())
      ..fire(UiEvent2());
  });
}
