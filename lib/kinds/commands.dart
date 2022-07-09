import '../infra/typed_event_bus.dart';
import '../infra/typed_event_handler.dart';

abstract class Command implements SupportedTyped {}

abstract class CommandHandler extends TypedEventHandler<Command> {
  void handle(Command command);
}

class CommandEventBus extends TypedEventBus<Command> {}
