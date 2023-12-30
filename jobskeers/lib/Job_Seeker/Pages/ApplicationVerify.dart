import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Widgets/Job_list.dart';

import '../JobSeekerHomePage.dart';
import 'AllJobsListPage.dart';

class CV_Verification extends StatelessWidget {
  CV_Verification({super.key});




  @override

  String gender= "Male";
  String experience = "Any";
  String education = "Bachelor";
  int cv_uploded = 1;
  String fileName = "asif.cv";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [


          SizedBox(height: 80,),


          // Application Verification Later
          Column(
            children: [
              (education == "Bachelor" && experience == "Any" && gender == "Male")
                  ? Column(
                children: [
                  Text(
                    "Congratulations",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "You are eligible for this job.",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
                  : Column(
                children: [
                  Text(
                    "Sorry",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "You are not eligible for this job.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
                    child: Container(
                      width: double.maxFinite,
                      //height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "Please Update Your Profile",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),


          //Requirment box
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
                      "Requirement For This Job",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20,),

                    //Gender
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Gender
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 10,),

                            Text(
                              "Required: ${gender} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        (gender == "Male")
                            ? Icon(
                          Icons.cloud_done_rounded,
                          color: Colors.green,
                        )
                            : Icon(Icons.clear_rounded,
                          color: Colors.red,
                        ),

                      ],
                    ),

                    SizedBox(height: 25,),

                    //Education
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Gender
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Education",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 10,),

                            Text(
                              "Required: ${education} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        (education == "Bachelor")
                            ? Icon(
                          Icons.cloud_done_rounded,
                          color: Colors.green,
                        )
                            : Icon(Icons.clear_rounded,
                          color: Colors.red,
                        ),

                      ],
                    ),

                    SizedBox(height: 25,),

                    //Experience
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Gender
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Experience",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 10,),

                            Text(
                              "Required: ${experience} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        (experience == "Any")
                            ? Icon(
                          Icons.cloud_done_rounded,
                          color: Colors.green,
                        )
                            : Icon(Icons.clear_rounded,
                          color: Colors.red,
                        ),

                      ],
                    ),

                    SizedBox(height: 25,),

                    //CV uploded
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Gender
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CV / Resume",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 10,),

                            Text(
                              "${fileName}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 10,),


                            InkWell(
                              child: Container(
                                width: 200,
                                //height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue.shade300,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      "Re upload CV/Resume",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),

                        (cv_uploded != 0)
                            ? Icon(
                          Icons.cloud_done_rounded,
                          color: Colors.green,
                        )
                            : Icon(Icons.clear_rounded,
                          color: Colors.red,
                        ),

                      ],
                    ),

                  ],

                ),
              ),
            ),
          ),


          (education == "Bachelor" && experience == "Any" && gender == "Male")
              ? InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => JobSeekerHompage() ));
            },
            child: Container(
              width: 200,
              //height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff03438C),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Continue Application",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
              : InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AllJobslistPage() ));
            },
            child: Container(
              width: 200,
              //height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff03438C),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Browse Jobs",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
