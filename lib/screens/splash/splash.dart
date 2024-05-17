import 'dart:async';
import 'dart:developer';

import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/class/constant.dart';
import 'package:attendance_app/services/navgator_key.dart';
import 'package:attendance_app/providers/location_service_provider.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initApp();
    super.initState();
  }

  Future<void> initApp() async {
    await requestLocationPermission();
    // await fetchUserInfoAndNavigate();
    checkLoginDurationAndNavigate();
  }

  Future<void> requestLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          Fluttertoast.showToast(msg: 'Location permission not granted.');
          return;
        }
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      latitude = position.latitude;
      longitude = position.longitude;

      log('Latitude: $latitude, Longitude: $longitude');
    } catch (e) {
      log('Error requesting location permission: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Location permission not granted."),
        duration: Duration(seconds: 2),
      ));
    }
  }

  //
  Future<void> fetchUserInfoAndNavigate() async {
    LocationServiceProvider locationServiceProvider =
        Provider.of<LocationServiceProvider>(context, listen: false);
    await locationServiceProvider
        .fetchData(); // Fetch user info including location
    bool isLoggedIn = await FirebaseMethods.isUserSignedIn();
    if (context.mounted) {
      Future.delayed(const Duration(seconds: 2), () {
        if (isLoggedIn) {
          // service.routeNamedReplacement(Routes.homePageRoute);
          Navigator.pushReplacementNamed(context, Routes.homePageRoute);
        } else {
          // service.routeNamedReplacement(Routes.loginPageRoute);
          Navigator.pushReplacementNamed(context, Routes.loginPageRoute);
        }
      });
    }
  }

  Future<void> checkLoginDurationAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('loginDateTime', DateTime.now().toString());
    String? loginDateString = prefs.getString('loginDateTime');
    log('loginDateString==============================>>>>>>>>>>>>>>>>>>>>>>>${loginDateString.toString()}');
    if (loginDateString != null) {
      DateTime loginDateTime = DateTime.parse(loginDateString);
      DateTime currentDateTime = DateTime.parse('2024-05-15 18:10:49.001920');
      Duration difference = currentDateTime.difference(loginDateTime);
      bool isLoggedIn = await FirebaseMethods.isUserSignedIn();
      if (isLoggedIn && difference.inDays < 45) {
        // User is logged in and login duration is less than 45 days, navigate to home
        Navigator.pushReplacementNamed(context, Routes.homePageRoute);
      } else {
        // User needs to re-login or log out
        Navigator.pushReplacementNamed(context, Routes.loginPageRoute);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Login session expired."),
          duration: Duration(seconds: 2),
        ));
      }
    } else {
      // No login date found, navigate to login screen
      Navigator.pushReplacementNamed(context, Routes.loginPageRoute);
    }
  }

  late double latitude;
  late double longitude;
  NavigationService service = NavigationService();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorConst.deepPurpleColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HRMS Attendance',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image(
              image: AssetImage('assets/images/splash.png'),
              height: 200,
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
