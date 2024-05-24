import 'package:attendance_app/components/custom_popup.dart';
import 'package:attendance_app/routes/route_const.dart';
import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'HRMS Attendance',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                        image: AssetImage('assets/images/splash.png'),
                        height: 80),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.info),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Leave Approval'),
            leading: const Icon(Icons.info),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.leaveApprovalRoute);
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            leading: const Icon(Icons.logout),
            onTap: () {
              CustomPopup.showLogoutPopup(context: context);
              //Navigator.pop(context);
              // Navigator.pushReplacementNamed(context, Routes.loginPageRoute);
            },
          ),
        ],
      ),
    );
  }
}
