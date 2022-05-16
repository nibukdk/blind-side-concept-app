import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = FutureProvider<SharedPreferences>((_) async {
  final prefs = await SharedPreferences.getInstance();
  return Future.delayed(const Duration(seconds: 2), () => prefs);
});
