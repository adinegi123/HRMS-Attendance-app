import 'package:attendance_app/components/secondary_appbar.dart';
import 'package:attendance_app/providers/bottom_navbar_provider.dart';
import 'package:attendance_app/screens/calender_page/calender_page.dart';
import 'package:attendance_app/screens/dashboard/dashboard_view.dart';
import 'package:attendance_app/screens/profile/profile_page.dart';
import 'package:attendance_app/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

        return Scaffold(
          backgroundColor: Colors.deepPurple.shade100,
          appBar: SecondaryAppBar(
            screenName: 'Attendance',
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
          body: pages[bottomNavBarProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: bottomNavBarProvider.selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: (index) {
              bottomNavBarProvider.setIndex(index);
            },
          ),
          drawer: const Drawers(),
        );
      },
    );
  }
}
