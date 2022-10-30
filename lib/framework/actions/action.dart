import '../pages/page.dart';

enum ActionType {
  onTap,
  onDoubleTap,
  onLongPress,
}

class Action {
  String? name;
  ActionType type = ActionType.onTap;
  ActionDetails? details;
}

abstract class ActionDetails {}

abstract class NavigationActionDetails extends ActionDetails {}

abstract class BackendDatabaseDetails extends ActionDetails {}

abstract class UiInteractionsActionDetails extends ActionDetails {}

abstract class AlertsActionDetails extends ActionDetails {}

class NavigateTo extends NavigationActionDetails {
  BuzzPage? page;
  bool allowBackNavigation = true;
  bool replaceRoute = false;
  //TODO: Add transition type
  //TODO: Add parameters
}

class NavigateBack extends NavigationActionDetails {}
