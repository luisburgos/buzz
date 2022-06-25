# Events

By default the framework supports firing three base class events:
- `UiEvent`: Defined as any User Interaction, it MUST be named behind user interface components.
- `Command`: Defined as requests to execute Business Logic.
- `AppEvent`: Defined as results from the execution of Business Logic code.

## UiEvents

Out-of-the-box supported UiEvents:
- `OnTapped`.
- `OnScroll` with `OnScrollDirection` enum.
- `OnSwipe` with `OnSwipeDirection` enum.
- `OnToggleChanged`.
- `OnFocusChanged`.
- `OnValueChanged`.
- `OnValueCopied`.
- `OnValuePasted`.

## Commands

### NavigationCommands

## AppEvents
