import 'package:core/core.dart';

abstract class EventRecord {
  String get name;
  Map<String, dynamic>? get params;
  DateTime get timestamp;

  @override
  String toString() {
    return "[$name, $params, $timestamp]";
  }
}

class EventRecordsInMemoryStore {
  final _state = InMemoryStore<List<EventRecord>>([]);

  Stream<List<EventRecord>> listStateChanges() => _state.stream;

  List<EventRecord> get currentList => _state.value;

  Future<void> loadList() async {
    //TODO: Implement loading items from a local file or a remote.
  }

  Future<void> wipeList() async {
    _state.value = [];
  }

  void dispose() => _state.close();

  void add(EventRecord event) {
    _state.value.add(event);
  }
}
