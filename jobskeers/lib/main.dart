import 'package:flutter/material.dart';


import 'Job_Seeker/JobSeekerForgetPass.dart';
import 'Job_Seeker/JobSeekerSign_In.dart';
import 'Job_Seeker/JobSeekerRegister.dart';
import 'Select_JobSekkerAndEmplpoyer.dart';
import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff03438C),
      ),
        useMaterial3: true,
      ),
      home: JobSeekerForgetPassScreen(),
      //home : JobSeekerRegisterScreen(),
    );
  }
}

