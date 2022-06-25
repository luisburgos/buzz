import 'dart:developer' as developer;

void developerLog(String message, {String name = 'BUZZ'}) {
  developer.log(message, name: name);
}
