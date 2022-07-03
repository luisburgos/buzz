import 'package:buzz/buzz.dart';
import 'package:buzz/utils.dart';
import 'package:event_bus/event_bus.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class UiEventBus extends TypedEventBus<UiEvent> {
  @override
  bool isTypeSupported(dynamic type) {
    buzzLog('$runtimeType: $type - ${type is UiEvent}');
    return type is UiEvent;
  }
}

class TestUiEventA extends UiEvent {}

class TestUiEventB extends UiEvent {}

class UiEventHandler extends Mock implements TypedEventHandler<UiEvent> {
  @override
  void handle(UiEvent event) {
    buzzLog(event.toString());
  }
}

void main() {
  test('Pivot', () {
    final child = TestUiEventA();
    expect(child.runtimeType, TestUiEventA);
  });

  test('UiEvent TypedEventBus', () {
    EventBus eventBus = EventBus();
    Future f = eventBus.on<UiEvent>().toList();

    // when
    eventBus.fire(TestUiEventA());
    eventBus.destroy();

    // then
    return f.then((events) {
      expect(events.length, 1);
    });
  });
}
