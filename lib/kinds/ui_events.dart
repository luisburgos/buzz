import '../infra/typed_event_bus.dart';

abstract class UIEvent {}

abstract class UIEventHandler extends TypedEventHandler<UIEvent> {
  void handle(UIEvent uiEvent);
}

class UIEventBus extends TypedEventBus<UIEvent> {
  @override
  bool isTypeSupported(dynamic type) {
    return type is UIEvent;
  }
}

class OnTapped extends UIEvent {}

enum OnScrollDirection {
  up,
  down,
}

abstract class OnScroll extends UIEvent {
  OnScrollDirection get direction;
}

enum OnSwipeDirection {
  left,
  right,
}

abstract class OnSwipe extends UIEvent {
  OnSwipeDirection get direction;
}

abstract class OnToggleChanged extends UIEvent {
  bool get isEnabled;
  bool get isDisabled => !isEnabled;
}

abstract class OnFocusChanged extends UIEvent {
  bool get hasFocus;
}

class OnValueChanged extends UIEvent {}

class OnValuePasted extends UIEvent {}

class OnValueCopied extends UIEvent {}
