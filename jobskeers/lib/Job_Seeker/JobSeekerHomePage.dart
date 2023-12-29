import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Widgets/HomePage_hadder.dart';

class JobSeekerHompage extends StatefulWidget {
  const JobSeekerHompage({super.key});

  @override
  State<JobSeekerHompage> createState() => _JobSeekerHompageState();
}

class _JobSeekerHompageState extends State<JobSeekerHompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Example 1: Using Container with fixed height
          Container(
            height: 200, // Set a fixed height
            child: HomePageHadder(),
          ),

          // Example 2: Using Expanded to take available space
          // Expanded(
          //   child: HomePageHadder(),
          // ),
        ],
      ),
    );
  }
}
