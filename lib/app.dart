import 'package:attendance_app/providers/bottom_navbar_provider.dart';
import 'package:attendance_app/providers/image_provider.dart';
import 'package:attendance_app/providers/password_visibility_provider.dart';
import 'package:attendance_app/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  static PasswordVisibilityProvider passwordVisibility =
      PasswordVisibilityProvider();
  static BottomNavBarProvider bottomNavBar = BottomNavBarProvider();
  static ImagePickerProvider imageProvider = ImagePickerProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: passwordVisibility),
        ChangeNotifierProvider.value(value: bottomNavBar),
        ChangeNotifierProvider.value(value: imageProvider),
      ],
      child: MaterialApp(
        title: 'Attendance App',
        debugShowCheckedModeBanner: false,
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
