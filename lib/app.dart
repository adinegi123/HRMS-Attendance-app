import 'package:attendance_app/providers/bottom_navbar_provider.dart';
import 'package:attendance_app/providers/image_provider.dart';
import 'package:attendance_app/providers/location_service_provider.dart';
import 'package:attendance_app/providers/password_visibility_provider.dart';
import 'package:attendance_app/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  static PasswordVisibilityProvider passwordVisibility =
      PasswordVisibilityProvider();
  static BottomNavBarProvider bottomNavBar = BottomNavBarProvider();
  static ImagePickerProvider imageProvider = ImagePickerProvider();
  static LocationServiceProvider locationServiceProvider = LocationServiceProvider();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: passwordVisibility),
        ChangeNotifierProvider.value(value: bottomNavBar),
        ChangeNotifierProvider.value(value: imageProvider),
        ChangeNotifierProvider.value(value: locationServiceProvider),
      ],
      child: MaterialApp(
        title: 'Attendance App',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: _scaffoldMessengerKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.onGenerateRoute,
      ),
    );
  }
}
