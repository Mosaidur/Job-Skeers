import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Pages/Home%20Page/JobSeekerHomePage.dart';

import 'Pages/ComingSoon.dart';



class JobSeekerMainpage extends StatefulWidget {
  const JobSeekerMainpage({super.key});

  @override
  State<JobSeekerMainpage> createState() => _JobSeekerMainpageState();
}

class _JobSeekerMainpageState extends State<JobSeekerMainpage> {

  int selectedIndex = 0;
  final List pages = [
    JobSeekerHomePage(),
    ComingSoon(),
    ComingSoon(),
    ComingSoon(),
    ComingSoon(),
  ];

  @override
  Widget build(BuildContext context) {
    // Adjust the breakpoint as needed
          return Scaffold(

            body: pages[selectedIndex],

            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: true,
              iconSize: 20,
              selectedItemColor: Color(0xff03438C),
              unselectedItemColor: Colors.grey,
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.school),label: "Learning"),
                BottomNavigationBarItem(icon: Icon(Icons.apps),label: "More"),
                BottomNavigationBarItem(icon: Icon(Icons.work),label: "My Jobs"),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
              ],
            ),

          );

  }
}

