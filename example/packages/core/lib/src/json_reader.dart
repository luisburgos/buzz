import 'dart:convert';

import 'package:flutter/services.dart';

class JsonReader {
  static Future<List<T>> readList<T>(
    String fileName,
    T Function(Object) fromJson,
  ) async {
    var jsonText = await rootBundle.loadString(fileName);
    List<dynamic> rawList = json.decode(jsonText);

    var parsedList = <T>[];
    for (var json in rawList) {
      parsedList.add(fromJson(json));
    }

    return parsedList;
  }
}
