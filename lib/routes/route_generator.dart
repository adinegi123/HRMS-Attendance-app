import 'package:attendance_app/routes/route_const.dart';
import 'package:attendance_app/screens/calender_page/calender_page.dart';
import 'package:attendance_app/screens/home/homepage.dart';
import 'package:attendance_app/screens/login/login.dart';
import 'package:attendance_app/screens/profile/profile_page.dart';
import 'package:attendance_app/screens/signup/signup.dart';
import 'package:attendance_app/screens/splash/splash.dart';
import 'package:attendance_app/shared%20widgets/fade_route_transition.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'dart:io';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    Map<String, dynamic> arguments = <String, dynamic>{};

    if (settings.arguments != null) {
      arguments = settings.arguments as Map<String, dynamic>;
    }

    log(settings.name ?? "Null Route Name");

    ///Helper to navigate from router
    navigateToScreen({required RouteSettings settings, required Widget route}) {
      if (Platform.isIOS) {
        return CupertinoPageRoute(builder: (_) => route);
      }
      return FadeRoute(settings: settings, route: route);
    }

    switch (settings.name) {
      case "/":
        return navigateToScreen(
          settings: settings,
          route: const SplashScreen(),
        );
      case Routes.loginPageRoute:
        return navigateToScreen(
            settings: settings,
            route: Login(formKey: GlobalKey<FormState>(),)
        );
      case Routes.homePageRoute:
        return navigateToScreen(
            settings: settings,
            route: const Home()
        );
      case Routes.signUpPageRoute:
        return navigateToScreen(
            settings: settings,
            route: SignUp(formKey:GlobalKey<FormState>(),)
        );
      case Routes.profilePageRoute:
        return navigateToScreen(
          settings: settings,
          route: ProfilePage(),
        );
      case Routes.calenderPageRoute:
        return navigateToScreen(
          settings: settings,
          route: CalendarPage(),
        );

      default:
        return FadeRoute(
          settings: settings,
          route: const SplashScreen(),
        );
    }
  }
}
