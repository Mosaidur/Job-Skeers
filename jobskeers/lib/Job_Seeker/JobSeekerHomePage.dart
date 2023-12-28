import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobSeekerHompage extends StatefulWidget {
  const JobSeekerHompage({super.key});

  @override
  State<JobSeekerHompage> createState() => _JobSeekerHompageState();
}

class _JobSeekerHompageState extends State<JobSeekerHompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


              ],
            )
          ],
        ),
      ),
    );
  }
}
