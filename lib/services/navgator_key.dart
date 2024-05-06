
import 'package:flutter/material.dart';
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class NavigationService {

   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

   dynamic routeTo(String route, {dynamic arguments}) {
      return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
   }
   dynamic routeNamedReplacement(String route){
      return navigatorKey.currentState?.pushReplacementNamed(route);
   }

   dynamic goBack() {
      return navigatorKey.currentState?.pop();
   }
}