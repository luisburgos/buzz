import '../infra/typed_event_bus.dart';
import '../infra/typed_event_handler.dart';

abstract class UiEvent {}

abstract class UIEventHandler extends TypedEventHandler<UiEvent> {}

class UiEventBus extends TypedEventBus<UiEvent> {}

class OnTapped extends UiEvent {}

enum OnScrollDirection {
  up,
  down,
}

abstract class OnScroll extends UiEvent {
  OnScrollDirection get direction;
}

enum OnSwipeDirection {
  left,
  right,
}

abstract class OnSwipe extends UiEvent {
  OnSwipeDirection get direction;
}

abstract class OnToggleChanged extends UiEvent {
  bool get isEnabled;
  bool get isDisabled => !isEnabled;
}

abstract class OnFocusChanged extends UiEvent {
  bool get hasFocus;
}

class OnValueChanged extends UiEvent {}

class OnValuePasted extends UiEvent {}

class OnValueCopied extends UiEvent {}
