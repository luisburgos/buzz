import 'package:buzz/buzz.dart';
import 'package:buzz/event_bus_holder_impl.dart';
import 'package:test/test.dart';

class BaseAppEvent extends AppEvent {}

void main() {
  test('', () {
    final eventBusHolder = EventBusHolderImpl();
    expect(eventBusHolder.totalBuses, 0);

    eventBusHolder.addEventBus(AppEventBus());
    expect(eventBusHolder.totalBuses, 1);

    eventBusHolder
      ..addEventBus(CommandEventBus())
      ..addEventBus(UiEventBus());
    expect(eventBusHolder.totalBuses, 3);
  });

  test('', () {
    final eventBusHolder = EventBusHolderImpl();
    expect(
      () => eventBusHolder.forKind(AppEventBus),
      throwsA(isA<BusNotFound>()),
    );
  });

  test('', () {
    final eventBusHolder = EventBusHolderImpl()..addEventBus(AppEventBus());

    expect(
      eventBusHolder.forKind(BaseAppEvent),
      isA<AppEventBus>(),
    );
  });

  test('', () {
    final eventBusHolder = EventBusHolderImpl()
      ..addEventBus(AppEventBus())
      ..addEventBus(CommandEventBus())
      ..addEventBus(UiEventBus());

    expect(
      eventBusHolder.of<AppEventBus>(),
      isA<AppEventBus>(),
    );
  });
}
