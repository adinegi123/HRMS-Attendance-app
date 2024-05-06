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
    await fetchUserInfoAndNavigate();
  }

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
      Fluttertoast.showToast(msg: 'Error requesting location permission.');
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
