import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Select_JobSekkerAndEmplpoyer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer (){
    Timer (Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SelectJobSekkerAndEmplpoyer () ),
            )
    );
  }

  @override

  void initState (){
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xffEFF6FE),
     //    backgroundColor: Colors.white,
      body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        // "assets/images/job-seeking.gif",
                           "assets/images/job-search.png",
                      width: 100,
                      ),
                      SizedBox(height: 15,),
                      Text(
                        "Seeker",
                        style: TextStyle(
                          color: Color(0xff3AB4FB),
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          // color: darktheme? Colors.white: Colors.teal.shade400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      ),

      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 150,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/cdc_logo.png",height: 80,),
                Image.asset("assets/images/skilljobs_logo.png",height: 80,)
              ],
            ),
            Image.asset("assets/images/Daffodil-International-University-DIU-logo.png",height: 50,)
          ],
        ),
      ),
    );
  }
}


