import '../console/console_entries_view.dart';

class FireAction {
  String label = '';
  List<ConsoleEntry> eventsData = [];
  int get count => eventsData.length;

  @override
  String toString() => '$label - count: $count';
}

class FireActions {
  Map<String, FireAction> actions = {
    'ui': FireAction()..label = 'fired [0]',
    'command': FireAction()..label = 'fired [0]',
    'app': FireAction()..label = 'fired [0]',
  };

  FireAction get ui => actionFor('ui');
  FireAction get command => actionFor('command');
  FireAction get app => actionFor('app');

  FireAction actionFor(String tag) {
    return actions[tag]!;
  }

  void setLabel(String tag, String label) {
    var action = actions[tag]!;
    action.label = label;
    actions[tag] = action;
  }

  void addEvent(String tag, ConsoleEntry eventData) {
    var action = actions[tag]!;
    action.eventsData.add(eventData);
    actions[tag] = action;
  }
}
