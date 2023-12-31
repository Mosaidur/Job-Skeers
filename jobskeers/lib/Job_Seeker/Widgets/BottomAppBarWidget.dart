import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/JobSeekerHomePage.dart';
import 'package:jobskeers/Job_Seeker/Pages/ComingSoon.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    JobSeekerHompage(),
    ComingSoon(),
    ComingSoon(),
    ComingSoon(),
    ComingSoon(),
  ];

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: pages,
    );
  }

  Widget buildNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Learning',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          label: 'More',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'My Job',
          backgroundColor: Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.transparent,
        ),
      ],
      selectedItemColor: Color(0xff03438C),
      unselectedItemColor: Colors.grey,
    );
  }
}
