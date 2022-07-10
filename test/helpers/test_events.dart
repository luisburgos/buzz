import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class BaseAppEvent extends AppEvent {}

class AppEvent1 extends AppEvent {}

class AppEvent2 extends AppEvent {}

class AppEvent3 extends AppEvent {}

class UiEvent1 extends UiEvent {}

class UiEvent2 extends UiEvent {}

class Command1 extends Command {}

class Command2 extends Command {}

class NotAUiEvent {}

//TODO: Verify remove
class UiEventHandler extends Mock implements TypedEventHandler<UiEvent> {
  @override
  void handle(UiEvent event) {
    print(event.toString());
  }
}

class MockNavigator extends Mock implements Navigator {}

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
    Buzz.init(
      navigator: MockNavigator(),
    );

    if (expectUiEvents != null) {
      expectLater(
        Buzz.uiEvents.on(),
        emitsInOrder(expectUiEvents()),
      );
    }

    if (expectAppEvents != null) {
      expectLater(
        Buzz.appEvents.on(),
        emitsInOrder(expectAppEvents()),
      );
    }

    if (expectCommands != null) {
      expectLater(
        Buzz.commands.on(),
        emitsInOrder(expectCommands()),
      );
    }

    //When
    fire().forEach((element) {
      Buzz.fire(element);
    });
  });
}
