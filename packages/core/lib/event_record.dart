abstract class EventRecord {
  String get name;
  Map<String, dynamic>? get params;
  DateTime get timestamp;

  @override
  String toString() {
    return "[$name, $params, $timestamp]";
  }
}
