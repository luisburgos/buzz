import 'package:buzz/infra/buzz_event_handler.dart';
import 'package:buzz/kinds/ui_events.dart';
import 'package:mockito/mockito.dart';

class UiEvent1 extends UiEvent {}

class UiEvent2 extends UiEvent {}

class UiEventHandler extends Mock implements BuzzEventHandler<UiEvent> {
  @override
  void handle(UiEvent event) {
    print(event.toString());
  }
}
