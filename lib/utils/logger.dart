import 'dart:developer' as developer;

void buzzLogger(String message, {String name = 'EVENT-BUZZ'}) {
  developer.log(message, name: name);
}
