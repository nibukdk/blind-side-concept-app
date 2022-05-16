import 'package:blind_side/globals/settings/router/app_router.dart';
import 'package:blind_side/globals/settings/theme/app_theme.dart';
import 'package:blind_side/screens/onboard/onboard_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends ConsumerStatefulWidget {
  late SharedPreferences prefs;
  MyApp(this.prefs, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouterProvider = Provider<GoRouter>((ref) {
      final onboardNotifier = ref.read(onboardNotifierProvider);
      return AppRouter(widget.prefs, onboardNotifier).router;
    });

    final routeProvider = ref.watch(appRouterProvider);
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: blindSideTheme,
        routeInformationParser: routeProvider.routeInformationParser,
        routerDelegate: routeProvider.routerDelegate);
  }
}
