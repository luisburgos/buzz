import 'dart:developer' as developer;

void buzzLog(String message, {String name = 'BUZZ'}) {
  developer.log(message, name: name);
}
