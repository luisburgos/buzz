import 'package:rxdart/rxdart.dart';

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

/// An in-memory store backed by BehaviorSubject that can be used to
/// store the data for all the fake repositories in the app.
class InMemoryStore<T> {
  InMemoryStore(T initial) : _subject = BehaviorSubject<T>.seeded(initial);

  /// The BehaviorSubject that holds the data
  final BehaviorSubject<T> _subject;

  bool get isWaiting => !_subject.hasValue && !_subject.hasError;

  /// The output stream that can be used to listen to the data
  Stream<T> get stream => _subject.stream;

  /// A synchronous getter for the current value
  T get value => _subject.value;

  /// A setter for updating the value
  set value(T value) => _subject.add(value);

  /// Don't forget to call this when done
  void close() => _subject.close();
}
