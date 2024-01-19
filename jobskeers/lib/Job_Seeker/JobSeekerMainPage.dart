import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Pages/Home%20Page/JobSeekerHomePage.dart';

import 'Pages/ComingSoon.dart';
import 'Pages/Learning/LearningPage.dart';
import 'Pages/My Job/My_jobsPage.dart';
import 'Pages/Profile/JobSeekerProfile.dart';



class JobSeekerMainpage extends StatefulWidget {

   JobSeekerMainpage({Key? key});

  @override
  State<JobSeekerMainpage> createState() => _JobSeekerMainpageState();
}

class _JobSeekerMainpageState extends State<JobSeekerMainpage> {
  // late List pages;


    final List pages = [
      JobSeekerHomePage(),
      LearningPage(),
      ComingSoon(),
      MyJobPage(),
      JobSeekerProfilePage(),
    ];

  int selectedIndex = 0;


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

