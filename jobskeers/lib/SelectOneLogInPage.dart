import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Authentiction%20Pages/JobSeekerRegister.dart';

import 'Job_Seeker/Authentiction Pages/JobSeekerSign_In.dart';

class SelectOne extends StatefulWidget {
  const SelectOne({super.key});

  @override
  State<SelectOne> createState() => _SelectOneState();
}

class _SelectOneState extends State<SelectOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 80,),
              // Banner Photo
              Container(
                width: double.maxFinite,
                child: Image.asset("assets/images/SelectJobSeekerAnd Employer.jpg"),
              ),

              // Select Job Seeker
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> JobSeekerSigninScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width/2.2,
                        decoration: BoxDecoration(
                            color:  Color(0xff03438C) ,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
                            child: Text(
                              "I am a Job Seeker",
                              style: TextStyle(
                                color:  Colors.white ,
                                fontWeight:  FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Select Employer
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/2.2,
                      decoration: BoxDecoration(
                          color:  Color(0xffcae6f1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
                          child: Text(
                            "I an an Empolyer",
                            style: TextStyle(
                              color:  Colors.black,
                              fontWeight: FontWeight.bold ,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 200,
        child: Column(
          children: [
            Text(
                "Powered by",
              style: TextStyle(
                color: Color(0xff03438C),
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/cdc_logo.png",height: 100,),
                Image.asset("assets/images/skilljobs_logo.png",height: 100,)
              ],
            ),
            Image.asset("assets/images/Daffodil-International-University-DIU-logo.png",height: 50,)
          ],
        ),
      ),
    );
  }
}
