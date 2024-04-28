import 'dart:async';
import 'dart:developer';

import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:attendance_app/screens/login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late Timer _timer;

  @override
  void initState() {
    checkLoginStatusAndNavigate();
    super.initState();

    // _timer = Timer(const Duration(seconds: 5), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Login(
    //         formKey: GlobalKey<FormState>(),
    //       ),
    //     ),
    //   );
    // });
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
              'HRMS Attendence',
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
