import 'dart:async';
import 'dart:developer';

import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 final Location location = Location();


  @override
  void initState()  {
    getLocation(location: location).then((locationData) {
      if (locationData != null) {
        log("latitude-->${locationData.latitude}");
        log("longitude-->${locationData.longitude}");
      } else {
        // Handle case when location data is null
        log("Location data is null");
      }
      checkLoginStatusAndNavigate();
    });
    checkLoginStatusAndNavigate();
    super.initState();

  }

  Future<LocationData?> getLocation({required Location location}) async {
    var serviceEnabled = await location.serviceEnabled();
    log('serviceEnabled $serviceEnabled');
    if (!serviceEnabled) {
      var serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    var permissionRes = await location.hasPermission();
    log('permissionRes $permissionRes');
    if (permissionRes == PermissionStatus.denied ||
        permissionRes == PermissionStatus.deniedForever) {
      var permissionRes = await location.requestPermission();
      if (permissionRes != PermissionStatus.granted) {
        return null;
      }
    }

    log('Get Location');

    //Success Case
    try {
      var locationData = await location.getLocation();
      log('locationData $locationData');
      return locationData;
    } catch (e) {
      log('This is location error $e');
      return null;
    }
  }
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
