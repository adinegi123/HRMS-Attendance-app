import 'dart:async';
import 'dart:developer';

import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/Local%20Database/local_database.dart';
import 'package:attendance_app/providers/location_service_provider.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:location/location.dart' as loc;
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late Timer _timer;

  @override
  void initState()  {
    checkLoginStatusAndNavigate();
    super.initState();
    // checkLoginStatusAndNavigate();
    // initApp();

  }

  // Future<void> initApp() async {
  //   await requestLocationPermission();
  //   await fetchUserInfoAndNavigate();
  // }
  //
  // Future<void> requestLocationPermission() async {
  //   loc.Location location = loc.Location();
  //   bool serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       Fluttertoast.showToast(msg: 'Location service not enabled.');
  //       return;
  //     }
  //   }
  //   loc.PermissionStatus permission = await location.hasPermission();
  //   if (permission == loc.PermissionStatus.denied ||
  //       permission == loc.PermissionStatus.deniedForever) {
  //     permission = await location.requestPermission();
  //     if (permission != loc.PermissionStatus.granted) {
  //       Fluttertoast.showToast(msg: 'Location permission not granted.');
  //       return;
  //     }
  //   }
  // }
  //
  // Future<void> fetchUserInfoAndNavigate() async {
  //   LocationServiceProvider locationServiceProvider =
  //       Provider.of<LocationServiceProvider>(context, listen: false);
  //   await locationServiceProvider
  //       .fetchData(); // Fetch user info including location
  //   bool isLoggedIn = await FirebaseMethods.isUserSignedIn();
  //   if (isLoggedIn) {
  //     Navigator.pushReplacementNamed(context, Routes.homePageRoute);
  //   } else {
  //     Navigator.pushReplacementNamed(context, Routes.loginPageRoute);
  //   }
  // }
  //
  Future<void> checkLoginStatusAndNavigate() async {
    bool isLoggedIn = await FirebaseMethods.isUserSignedIn();
    // bool isLoggedIn = await LocalDb.isLogin();
    log('loginStatus $isLoggedIn');
    if (context.mounted) {
      Future.delayed(const Duration(seconds: 3), () {
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, Routes.homePageRoute);
        } else {
          Navigator.pushReplacementNamed(context, Routes.loginPageRoute);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HRMS Attendance',
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
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
