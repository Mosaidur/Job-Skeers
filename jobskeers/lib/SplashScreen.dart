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
  get darktheme => null;

  startTimer (){
    Timer (Duration(seconds: 3), 
            () => Navigator.push(context, 
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
      body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(darktheme?"image/zanbahon_no color_no_bg.png":"image/zanbahon_pest-color_no-bg.png"),
                  SizedBox(height: 15,),
                  Text(
                    "Fastest & Safest",
                    style: TextStyle(
                      color: darktheme ? Colors.white: Colors.teal.shade400,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      // color: darktheme? Colors.white: Colors.teal.shade400,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}


