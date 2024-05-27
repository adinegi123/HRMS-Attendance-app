import 'dart:io';
import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:flutter/material.dart';

import '../components/custom_text_widget.dart';

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
       /*title: const Text('Confirm Logout'),
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
       ],*/
         content: Container(
           height: 130,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               const MyTextWidget(text: "Do you want to logout?"),
               const SizedBox(height: 30),
               Row(
                 children: [
                   Expanded(
                     child: ElevatedButton(
                       onPressed: () async{
                         await FirebaseMethods.signOut(context);
                         Navigator.pushNamedAndRemoveUntil(
                             context,
                             Routes.loginPageRoute,
                             ModalRoute.withName(Routes.loginPageRoute));
                         //exit(0);
                       },
                       style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.white),
                       child: const Text("Yes",style: TextStyle(color: Colors.black)),
                     ),
                   ),
                   const SizedBox(width: 15),
                   Expanded(
                       child: ElevatedButton(
                         onPressed: () {
                           Navigator.of(context).pop();
                         },
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.white,
                         ),
                         child: const Text("No", style: TextStyle(color: Colors.black)),
                       ))
                 ],
               )
             ],
           ),
         ),
       );
     }
}
