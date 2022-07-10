import 'package:test/test.dart';

import 'helpers/test_events.dart';

void main() {
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
    'Buzz alternately  emits two AppEvents and two UiEvents',
    expectAppEvents: () => [
      isA<AppEvent1>(),
      isA<AppEvent2>(),
    ],
    expectUiEvents: () => [
      isA<UiEvent1>(),
      isA<UiEvent2>(),
    ],
    fire: () => [
      UiEvent1(),
      AppEvent1(),
      UiEvent2(),
      AppEvent2(),
    ],
  );
}
