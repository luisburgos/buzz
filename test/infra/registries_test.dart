import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../fixtures/app_events.dart';
import '../fixtures/commands.dart';
import '../fixtures/navigator.dart';
import '../fixtures/ui_events.dart';

typedef AppEvent1Handler = TypedEventHandler<AppEvent1>;
typedef ChildAppEvent1Handler = TypedEventHandler<ChildAppEvent1>;

class ChildAppEvent1 extends AppEvent1 {}

class MockBuzzEventHandlersRegistries extends Mock
    implements BuzzEventHandlersRegistries {
  static int counter = 0;

  MockBuzzEventHandlersRegistries({
    List<EventHandlerRegistry> uiEvents = const [],
    List<EventHandlerRegistry> commands = const [],
    List<EventHandlerRegistry> appEvents = const [],
  })  : _uiEvents = uiEvents,
        _commands = commands,
        _appEvents = appEvents;

  final List<EventHandlerRegistry> _uiEvents;
  final List<EventHandlerRegistry> _commands;
  final List<EventHandlerRegistry> _appEvents;

  @override
  List<EventHandlerRegistry> get uiEvents => _uiEvents;

  @override
  List<EventHandlerRegistry> get commands => _commands;

  @override
  List<EventHandlerRegistry> get appEvents => _appEvents;
}

class MockUiEvent1Handler extends Mock implements TypedEventHandler<UiEvent1> {}

class MockChildBaseAppEventHandler extends Mock
    implements TypedEventHandler<ChildAppEvent1> {}

class MockAppEvent1Handler extends Mock
    implements TypedEventHandler<AppEvent1> {}

class MockCommand1Handler extends Mock implements TypedEventHandler<Command1> {}

void main() {
  test('EventHandlerRegistry.registryType works for base class', () {
    final registry = EventHandlerRegistry<AppEvent1>(
      MockAppEvent1Handler(),
    );
    expect(
      registry.registryType,
      AppEvent1,
    );
  });

  test('EventHandlerRegistry.isSupportedType works AppEvent1 in its child', () {
    final registry = EventHandlerRegistry<AppEvent1>(
      MockAppEvent1Handler(),
    );
    expect(
      registry.isSupportedType(AppEvent1()),
      true,
    );
    expect(
      registry.isSupportedType(ChildAppEvent1()),
      true,
    );
    expect(
      registry.isSupportedType(AppEvent2()),
      false,
    );
  });

  test('EventHandlerRegistry.handler matches generic types', () {
    final registry = EventHandlerRegistry<ChildAppEvent1>(
      MockChildBaseAppEventHandler(),
    );

    //Validates handler is proper type.
    expect(
      registry.eventHandler.handle.runtimeType,
      MockChildBaseAppEventHandler().handle.runtimeType,
    );
  });

  test('TestRegistries access to registries matches length by lane', () {
    final testRegistries = MockBuzzEventHandlersRegistries(
      uiEvents: [
        EventHandlerRegistry(MockUiEvent1Handler()),
      ],
      commands: [
        EventHandlerRegistry(
          MockCommand1Handler(),
        )
      ],
      appEvents: [
        EventHandlerRegistry(
          MockChildBaseAppEventHandler(),
        )
      ],
    );

    Buzz.init(
      navigator: MockNavigator(),
      registries: [testRegistries],
    );

    final registriesFromBuzz =
        (Buzz as BuzzBase).eventHandlersRegistries!.first;
    expect(registriesFromBuzz.uiEvents.length, 1);
    expect(registriesFromBuzz.commands.length, 1);
    expect(registriesFromBuzz.appEvents.length, 1);
  });

  test(
    'AppEventRegistry handler is called when firing event',
    () async {
      MockBuzzEventHandlersRegistries.counter = 0;
      final mockChildBaseAppEventHandler = MockChildBaseAppEventHandler();

      final testRegistries = MockBuzzEventHandlersRegistries(
        appEvents: [
          EventHandlerRegistry(
            mockChildBaseAppEventHandler,
          )
        ],
      );
      Buzz.init(
        navigator: MockNavigator(),
        registries: [testRegistries],
      );

      final stream = Buzz.appEvents
          .on()
          .where((event) => event is ChildAppEvent1)
          .cast<ChildAppEvent1>();

      print('STREAM: $stream');

      //Simulate ChildBaseAppEvent is fired and handler is called.
      Buzz.fire(ChildAppEvent1());
      expect(
        stream,
        emitsInOrder([
          isA<ChildAppEvent1>,
        ]),
      );

      expect(MockBuzzEventHandlersRegistries.counter, 1);
    },
    skip: 'TestRegistries.counter is not updated, mocking methods not working',
  );
}
