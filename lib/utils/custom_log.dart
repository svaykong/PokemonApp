import 'dart:developer' as dev show log;

extension CustomLog on Object {
  void log(dynamic msg) {
    dev.log(msg.toString());
  }
}

