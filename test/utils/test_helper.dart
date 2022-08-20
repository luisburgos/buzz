import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import '../fixtures/navigator.dart';

void initDefaultTestBuzz() {
  Buzz.init(
    navigator: MockNavigator(),
  );
}

void buzzTest(
  String message, {
  List<TypeMatcher<UiEvent>> Function()? expectUiEvents,
  List<TypeMatcher<AppEvent>> Function()? expectAppEvents,
  List<TypeMatcher<Command>> Function()? expectCommands,
  required List Function() fire,
}) {
  test(message, () {
    /// TODO: Allow customization.
    /// Default
    initDefaultTestBuzz();

    if (expectUiEvents != null) {
      expectLater(
        Buzz.uiEvents.eventBusStream,
        emitsInOrder(expectUiEvents()),
      );
    }

    if (expectAppEvents != null) {
      expectLater(
        Buzz.appEvents.eventBusStream,
        emitsInOrder(expectAppEvents()),
      );
    }

    if (expectCommands != null) {
      expectLater(
        Buzz.commands.eventBusStream,
        emitsInOrder(expectCommands()),
      );
    }

    //When
    for (var element in fire()) {
      Buzz.fire(element);
    }
  });
}
