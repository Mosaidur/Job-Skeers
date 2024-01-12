import 'package:flutter/material.dart';


import 'Job_Seeker/JobSeekerMainPage.dart';
import 'Job_Seeker/loading_page.dart';
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
        useMaterial3: false,
      ),
      // home: JobSeekerMainpage(),
      // home: LoadingPage(),
      home : SplashScreen(),
    );
  }
}

