import 'package:buzz/buzz.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'helpers/test_events.dart';

class UiEventBus extends TypedEventBus<UiEvent> {}

void main() {
  test('UiEventBus.supportedType is UiEvent', () {
    UiEventBus eventBus = UiEventBus();
    expect(
      eventBus.supportedType,
      UiEvent,
    );
  });

  test('UiEventBus.isTypeSupported use cases', () {
    UiEventBus eventBus = UiEventBus();

    ///TODO: Todo remove
    expect(
      eventBus.isTypeSupported<UiEvent1>(),
      true,
    );
    expect(
      eventBus.isTypeSupported<UiEvent2>(),
      true,
    );
    expect(
      eventBus.isTypeSupported<AppEvent1>(),
      false,
    );
    expect(
      eventBus.isTypeSupported<NotAUiEvent>(),
      false,
    );
  });
}
