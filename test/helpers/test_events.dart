import 'package:buzz/infra/typed_event_handler.dart';
import 'package:buzz/kinds/app_events.dart';
import 'package:buzz/kinds/ui_events.dart';
import 'package:mockito/mockito.dart';

class BaseAppEvent extends AppEvent {}

class AppEvent1 extends AppEvent {}

class AppEvent2 extends AppEvent {}

class AppEvent3 extends AppEvent {}

class UiEvent1 extends UiEvent {}

class UiEvent2 extends UiEvent {}

class NotAUiEvent {}

//TODO: Verify remove
class UiEventHandler extends Mock implements TypedEventHandler<UiEvent> {
  @override
  void handle(UiEvent event) {
    print(event.toString());
  }
}
