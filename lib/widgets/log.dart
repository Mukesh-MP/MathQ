import 'package:flutter/foundation.dart';

class CustomLog {
  static customprint(String customprint) {
    if (kDebugMode) {
      print(customprint.toString());
    }
  }
}
