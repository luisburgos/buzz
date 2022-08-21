import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../fixtures/app_events.dart';
import '../fixtures/navigator.dart';

typedef BaseAppEventHandler = TypedEventHandler<BaseAppEvent>;
typedef ChildBaseAppEventHandler = TypedEventHandler<ChildBaseAppEvent>;

class ChildBaseAppEvent extends BaseAppEvent {}

class TestRegistries extends BuzzEventHandlersRegistries {
  static int counter = 0;

  TestRegistries({
    required List<EventHandlerRegistry> appEvents,
  }) : _appEvents = appEvents;

  final List<EventHandlerRegistry> _appEvents;

  @override
  List<EventHandlerRegistry> get appEvents => _appEvents;
}

class MockChildBaseAppEventHandler extends Mock
    implements TypedEventHandler<ChildBaseAppEvent> {}

class MockBaseAppEventHandler extends Mock
    implements TypedEventHandler<BaseAppEvent> {}

void main() {
  test('AppEventRegistry.registryType works for base class', () {
    final registry = EventHandlerRegistry<BaseAppEvent>(
      MockBaseAppEventHandler(),
    );
    expect(
      registry.registryType,
      BaseAppEvent,
    );
  });

  test('AppEventRegistry.handler matches generic types', () {
    final registry = EventHandlerRegistry<ChildBaseAppEvent>(
      MockChildBaseAppEventHandler(),
    );

    //Validates handler is proper type.
    expect(
      registry.eventHandler.handle.runtimeType,
      MockChildBaseAppEventHandler().handle.runtimeType,
    );
  });

  test(
    'AppEventRegistry handler is called when firing event',
    () async {
      TestRegistries.counter = 0;
      final mockChildBaseAppEventHandler = MockChildBaseAppEventHandler();

      final testRegistries = TestRegistries(
        appEvents: [
          EventHandlerRegistry(
            mockChildBaseAppEventHandler,
          )
        ],
      );
      Buzz.init(
        navigator: MockNavigator(),
        eventHandlersRegistries: [
          testRegistries,
        ],
      );

      final stream = Buzz.appEvents
          .on()
          .where((event) => event is ChildBaseAppEvent)
          .cast<ChildBaseAppEvent>();

      print('STREAM: $stream');

      //Simulate ChildBaseAppEvent is fired and handler is called.
      Buzz.fire(ChildBaseAppEvent());
      expect(
        stream,
        emitsInOrder([
          isA<ChildBaseAppEvent>,
        ]),
      );

      expect(TestRegistries.counter, 1);
    },
    skip: 'TestRegistries.counter is not updated, mocking methods not working',
  );
}
