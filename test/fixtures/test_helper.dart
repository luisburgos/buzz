import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import 'navigator.dart';

void initDefaultTestBuzz() {
  Buzz.init(
    navigator: MockNavigator(),
  );
}

@Deprecated('Use [buzzTestEmitsInOrder] instead')
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

void buzzTestEmitsInOrder(
  String message, {
  Function()? given,
  required List Function() fire,
  List<Matcher> Function()? expectUiEventsMatchers,
  List<Matcher> Function()? expectAppEventsMatchers,
  List<Matcher> Function()? expectCommandsMatchers,
}) {
  test(message, () async {
    if (given != null) {
      await given();
    }

    if (expectUiEventsMatchers != null) {
      expectLater(
        Buzz.uiEvents.eventBusStream,
        emitsInOrder(expectUiEventsMatchers()),
      );
    }

    if (expectAppEventsMatchers != null) {
      expectLater(
        Buzz.appEvents.eventBusStream,
        emitsInOrder(expectAppEventsMatchers()),
      );
    }

    if (expectCommandsMatchers != null) {
      expectLater(
        Buzz.commands.eventBusStream,
        emitsInOrder(expectCommandsMatchers()),
      );
    }

    for (var element in fire()) {
      print('fire');
      Buzz.fire(element);
    }
  });
}
