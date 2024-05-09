import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:flutter/material.dart';

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
       title: const Text('Confirm Logout'),
       content: const Text('Are you sure you want to log out?'),
       actions: [
         TextButton(
           onPressed: () => Navigator.pop(context, false),
           child: const Text('No'),
         ),
         TextButton(
           onPressed: () async {
             await FirebaseMethods.signOut(context);
             Navigator.pushNamedAndRemoveUntil(
                 context,
                 Routes.splashPageRoute,
                 ModalRoute.withName(Routes.splashPageRoute));
           },
           child: const Text('Yes'),
         ),
       ],
     );
  }
}
