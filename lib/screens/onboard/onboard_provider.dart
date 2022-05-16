import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OnboardNotifier with ChangeNotifier {
// lets define a method to check and manipulate onboard status
  void hasOnboarded() async {
    // Get the SharedPreferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // set the onBoardCount to 1
    await prefs.setInt('onBoardCount', 1);
    // Notify listener provides converted value to all it listeneres
    notifyListeners();
  }
}

final onboardNotifierProvider = ChangeNotifierProvider(
  (_) => OnboardNotifier(),
);
