import 'package:attendance_app/screens/dashboard/provider/calender_provider.dart';
import 'package:attendance_app/services/navgator_key.dart';
import 'package:attendance_app/providers/bottom_navbar_provider.dart';
import 'package:attendance_app/providers/date_Provider.dart';
import 'package:attendance_app/providers/image_provider.dart';
import 'package:attendance_app/providers/location_service_provider.dart';
import 'package:attendance_app/providers/password_visibility_provider.dart';
import 'package:attendance_app/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  static PasswordVisibilityProvider passwordVisibility =
      PasswordVisibilityProvider();
  static BottomNavBarProvider bottomNavBar = BottomNavBarProvider();
  static ImagePickerProvider imageProvider = ImagePickerProvider();

  static LocationServiceProvider locationServiceProvider =
      LocationServiceProvider();

  static DateProvider dateProvider = DateProvider();
  static CalenderProvider calenderProvider = CalenderProvider();

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
        ChangeNotifierProvider.value(value: dateProvider),
        ChangeNotifierProvider.value(value: calenderProvider),
      ],
      child: MaterialApp(
        title: 'Attendance App',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: _scaffoldMessengerKey,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          dividerColor: Colors.transparent,
          datePickerTheme: const DatePickerThemeData(
              backgroundColor: Colors.white, cancelButtonStyle: ButtonStyle()),
        ),
        initialRoute: '/',
        // navigatorKey: NavigationService().navigatorKey,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
      ),
    );
  }
}
