import 'package:attendance_app/class/constant.dart';
import 'package:attendance_app/components/secondary_appbar.dart';
import 'package:attendance_app/providers/bottom_navbar_provider.dart';
import 'package:attendance_app/screens/calender_page/calender_page.dart';
import 'package:attendance_app/screens/dashboard/view/dashboard_view.dart';

import 'package:attendance_app/screens/profile/profile_page.dart';
import 'package:attendance_app/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/exit_popup.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, bottomNavBarProvider, _) {

        final List<Widget> pages = [
          const DashBoard(),
          const CalendarPage(),
          const ProfilePage(),
        ];

        return WillPopScope(
          onWillPop: () => showExitPopup(context),
          child: Scaffold(
            backgroundColor: Colors.deepPurple.shade100,
            appBar: SecondaryAppBar(
              screenName: 'Attendance',
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu,
                    color: Colors.white,),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
            body: SingleChildScrollView(
                child: pages[bottomNavBarProvider.selectedIndex]),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.deepPurple.shade300,
              items: const <BottomNavigationBarItem>[
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.home),
                //   label: 'Home',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white,),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month,color: Colors.white,),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person,color: Colors.white,),
                  label: 'Profile',
                ),
              ],
              currentIndex: bottomNavBarProvider.selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,

              onTap: (index) {
                bottomNavBarProvider.setIndex(index);
              },
            ),
            drawer: const Drawers(),
          ),
        );
      },
    );
  }
}
