import '../infra/typed_event_bus.dart';

abstract class Command {}

abstract class CommandHandler extends TypedEventHandler<Command> {
  void handle(Command command);
}

class CommandEventBus extends TypedEventBus<Command> {
  @override
  bool isTypeSupported(dynamic type) {
    return type is Command;
  }
}
