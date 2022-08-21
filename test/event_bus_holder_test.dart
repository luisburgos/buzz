import 'package:buzz/buzz.dart';
import 'package:buzz/event_bus_holder_impl.dart';
import 'package:test/test.dart';

import 'fixtures/app_events.dart';

void main() {
  test('eventBusHolder.totalBuses', () {
    final eventBusHolder = EventBusHolderImpl();
    expect(eventBusHolder.totalBuses, 0);

    eventBusHolder.addEventBus(AppEventBus());
    expect(eventBusHolder.totalBuses, 1);

    eventBusHolder
      ..addEventBus(CommandEventBus())
      ..addEventBus(UiEventBus());
    expect(eventBusHolder.totalBuses, 3);
  });

  test('eventBusHolder.forType throws BuzzChannelNotFound ', () {
    final eventBusHolder = EventBusHolderImpl();
    expect(
      () => eventBusHolder.forType<AppEvent1>(),
      throwsA(isA<BuzzTypedEventBusForTypeNotFound>()),
    );
  });

  test('eventBusHolder.of throws BuzzChannelNotFound ', () {
    final eventBusHolder = EventBusHolderImpl();
    expect(
      () => eventBusHolder.of<CommandEventBus>(),
      throwsA(isA<BuzzTypedEventBusForTypeNotFound>()),
    );
  });

  test('eventBusHolder.forType finds AppEventBus', () {
    final eventBusHolder = EventBusHolderImpl()..addEventBus(AppEventBus());

    expect(
      eventBusHolder.forType<AppEvent1>(),
      isA<AppEventBus>(),
    );
  });

  test('eventBusHolder.of finds AppEventBus', () {
    final eventBusHolder = EventBusHolderImpl()
      ..addEventBus(AppEventBus())
      ..addEventBus(CommandEventBus())
      ..addEventBus(UiEventBus());

    expect(
      eventBusHolder.of<AppEventBus>(),
      isA<AppEventBus>(),
    );
  });

  test('eventBusHolder.destroy', () {
    final eventBusHolder = EventBusHolderImpl()..addEventBus(AppEventBus());

    expect(eventBusHolder.totalBuses, 1);
    eventBusHolder.destroy();
    expect(eventBusHolder.totalBuses, 0);
  });

  test('cleanBuzz rebuilds instance when calling again', () {
    //Given
    final initialHashCode = EventBusHolder.hashCode;
    expect(EventBusHolder, isNotNull);
    //When
    cleanEventBusHolder();
    //Then
    expect(EventBusHolder.hashCode == initialHashCode, false);
  });
}
