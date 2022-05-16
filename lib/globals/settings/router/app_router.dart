import 'dart:async';

import 'package:blind_side/globals/settings/router/utils/router_utils.dart';
import 'package:blind_side/screens/home/home.dart';
import 'package:blind_side/screens/onboard/onboard_provider.dart';
import 'package:blind_side/screens/onboard/onboard_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  AppRouter(this.prefs, this.onboardNotifierProvider);
  late SharedPreferences prefs;
  late OnboardNotifier onboardNotifierProvider;

  get router => _router;

  late final _router = GoRouter(
      refreshListenable: onboardNotifierProvider,
      initialLocation: "/",
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: APP_PAGE.home.routePath,
          name: APP_PAGE.home.routeName,
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: APP_PAGE.onboard.routePath,
          name: APP_PAGE.onboard.routeName,
          builder: (context, state) => const OnBoardScreen(),
        ),
      ],
      redirect: (state) {
        // define the named path of onboard screen
        final String onboardPath =
            state.namedLocation(APP_PAGE.onboard.routeName);
        final String homePath = state.namedLocation(APP_PAGE.home.routeName);

        // Checking if current path is onboarding or not
        bool isOnboarding = state.subloc == onboardPath;
        bool isGoingHome = state.subloc == homePath;

        // check if sharedPref as onBoardCount key or not
        //if is does then we won't onboard else we will
        bool toOnboard = prefs.containsKey('onBoardCount') ? false : true;

        print(toOnboard);

        if (toOnboard) {
          // return null if the current location is already OnboardScreen to prevent looping
          return isOnboarding ? null : onboardPath;
        } else {
          return isGoingHome ? null : homePath;
        }

        // returning null will tell router to don't mind redirect section
        return null;
      });
}
