

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ApplicationVerify.dart';

class JobDescription extends StatefulWidget {
  JobDescription({
    super.key,
    required this.Education_level,
    required this.Job_Description,
    required this.Job_Responsibilities,
    required this.Job_reuirements,
    required this.Additional_reuirements,
    required this.Salary_Benifits,
    required this.Additional_info,
    required this.Read_Before_apply,
  });

  final String Education_level;
  final String Job_Description;
  final String Job_Responsibilities;
  final String Job_reuirements;
  final String Additional_reuirements;
  final String Salary_Benifits;
  final String Additional_info;
  final String Read_Before_apply;


  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //Education_level &  Job_Description;
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
          child: Container(
            width: double.maxFinite,
            // height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Basic Information",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //Education Level
                  Text(
                      "Education lavel : ${widget.Education_level}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //  Job Description
                  Text(
                    "Job Description  \n${widget.Job_Description}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),


                ],

              ),
            ),
          ),
        ),

        //Job_Responsibilities, Job_reuirements & Additional Reuirements;
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
          child: Container(
            width: double.maxFinite,
            //height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Job Responsibilities
                  Text(
                    "Job Responsibilities  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    widget.Job_Responsibilities,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Job Reuirements
                  Text(
                    "Job Reuirements ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    widget.Job_reuirements,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),


                  //Additional Reuirements
                  Text(
                    "Additional Reuirements  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    widget.Additional_reuirements,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),


                ],

              ),
            ),
          ),
        ),

        //Salary & Benifits , Additional Info
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
          child: Container(
            width: double.maxFinite,
            //height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Salary & Benifits Reuirements
                  Text(
                    "Salary and Benifits",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 15,),

                  Text(
                    widget.Salary_Benifits,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 10, ),

                  //Additional Information
                  Text(
                    "Additional Information",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 10, ),

                  Text(
                    widget.Additional_info,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),


                ],

              ),
            ),
          ),
        ),

        // Read_Before_apply
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
          child: Container(
            width: double.maxFinite,
            //height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  //Read Before Apply
                  Text(
                    "Read Before Apply",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Additional Info
                  Text(
                    widget.Read_Before_apply,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),


                ],

              ),
            ),
          ),
        ),

        //Apply
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CV_Verification ()));
            },
            child: Container(
              width: double.maxFinite,
              //height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade500,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
                child: Center(
                  child: Text(
                    "Apply Now",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
