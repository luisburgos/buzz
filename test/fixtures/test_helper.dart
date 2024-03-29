import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import 'mock_feedbacks_executor.dart';
import 'mock_navigator.dart';

void initDefaultTestBuzz({
  Navigator? navigator,
  FeedbacksExecutor? feedbacksExecutor,
}) {
  Buzz.init(
    navigator: navigator ?? MockNavigator(),
    feedbacksExecutor: feedbacksExecutor ?? MockFeedbacksExecutor(),
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
        Buzz.on<UiEvent>,
        emitsInOrder(expectUiEvents()),
      );
    }

    if (expectAppEvents != null) {
      expectLater(
        Buzz.on<AppEvent>,
        emitsInOrder(expectAppEvents()),
      );
    }

    if (expectCommands != null) {
      expectLater(
        Buzz.on<AppEvent>,
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
        Buzz.on<UiEvent>(),
        emitsInOrder(expectUiEventsMatchers()),
      );
    }

    if (expectAppEventsMatchers != null) {
      expectLater(
        Buzz.on<AppEvent>(),
        emitsInOrder(expectAppEventsMatchers()),
      );
    }

    if (expectCommandsMatchers != null) {
      expectLater(
        Buzz.on<Command>(),
        emitsInOrder(expectCommandsMatchers()),
      );
    }

    for (var element in fire()) {
      print('TEST_HELPER: firing: $element');
      Buzz.fire(element);
    }
  });
}
