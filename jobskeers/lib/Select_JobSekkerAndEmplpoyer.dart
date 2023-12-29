import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Authentiction%20Pages/JobSeekerRegister.dart';

import 'Job_Seeker/Authentiction Pages/JobSeekerSign_In.dart';

class SelectJobSekkerAndEmplpoyer extends StatefulWidget {
  const SelectJobSekkerAndEmplpoyer({super.key});

  @override
  State<SelectJobSekkerAndEmplpoyer> createState() => _SelectJobSekkerAndEmplpoyerState();
}

class _SelectJobSekkerAndEmplpoyerState extends State<SelectJobSekkerAndEmplpoyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            // Banner Photo
            Container(
              width: double.maxFinite,
              child: Image.asset("assets/images/SelectJobSeekerAnd Employer.jpg"),
            ),

            // Select Job Seeker
            Container(
              width: double.maxFinite,
              height: 250,
              color: Color(0xff03438C),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Text(
                    "Job Seeker",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Join & find your dream job today!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  InkWell(
                    onTap: () {
                      // Add your code or function call here
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> JobSeekerSigninScreen()));
                      // You can perform any action or navigate to a new screen, for example.
                    },
                    child: Container(
                      // Your container properties go here
                      width: 100.0,
                      height: 40.0,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Text(
                    "Or,",
                    style: TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  InkWell(
                    onTap: () {
                      // Add your code or function call here
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> JobSeekerRegisterScreen()));
                      // You can perform any action or navigate to a new screen, for example.
                    },
                    child: Text(
                      "Regester as A Job Seeker.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 1.0, // Adjust the thickness of the underline
                        decorationStyle: TextDecorationStyle.solid, // You can use other styles like dashed, dotted, etc.
                      ),
                    ),
                  ),


                ],
              ),
            ),






            // Select Employer
            Container(
              width: double.maxFinite,
              height: 250,
              color: Color(0xffcae6f1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "Employer",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Find the best candidates for your company.",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  InkWell(
                    onTap: () {
                      // Add your code or function call here
                      print('InkWell tapped!');
                      // You can perform any action or navigate to a new screen, for example.
                    },
                    child: Container(
                      // Your container properties go here
                      width: 100.0,
                      height: 40.0,
                      color: Color(0xff03438C),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Text(
                    "Or,",
                    style: TextStyle(
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  InkWell(
                    onTap: () {
                      // Add your code or function call here
                      print('InkWell tapped!');
                      // You can perform any action or navigate to a new screen, for example.
                    },
                    child: Text(
                      "Regester as An Employer.",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        decorationThickness: 1.0, // Adjust the thickness of the underline
                        decorationStyle: TextDecorationStyle.solid, // You can use other styles like dashed, dotted, etc.
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar:  ,
    );
  }
}
