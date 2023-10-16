
import 'dart:async';


/// Class to store runtime global settings.
class AppGlobals {
  factory AppGlobals() => instance;

  AppGlobals._();

  /// Singleton instance.
  static final AppGlobals instance = AppGlobals._();

  final StreamController<int> counterController = StreamController<int>();
  void closeStream() {
    counterController.close();
  }
}
