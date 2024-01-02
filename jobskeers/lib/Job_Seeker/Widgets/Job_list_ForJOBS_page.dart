import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/Browse Jobs/JobDetails.dart';
import 'RemainingDayCount.dart';



class JobListForJobsPage extends StatefulWidget {
  const JobListForJobsPage({super.key});

  @override
  State<JobListForJobsPage> createState() => _JobListForJobsPageState();
}

class _JobListForJobsPageState extends State<JobListForJobsPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetails()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          decoration: BoxDecoration(
            // color: Color(0xffcae6f1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            children: [

              //Job title , Company name & Company logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Job title and Company name Ciontainer
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Text(
                            "Job TitleJob TitleJob Title Job TitleJob TitleJob Title",
                            softWrap: true, // Enable soft wrapping
                            maxLines: 1,    // Limit the number of lines
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xff03438C),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Text(
                            "vCompany NameCompany NameCompany NameCompany NameCompany Name",
                            softWrap: true, // Enable soft wrapping
                            maxLines: 1,    // Limit the number of lines
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,top: 15.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/icons_2/Company logo.png"),
                    ),
                  )
                ],
              ),

              //Salary & Deadline Remaining date
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  //vertical: 15,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "৳ 20k - 30k BDT",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    RemainingDate(),

                  ],
                ),
              ),

              SizedBox(
                height: 5,
              ),

              //basic info in a row

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //Address Office
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black54,
                                width: 1
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xff03438C),
                                size: 18,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Dhaka,Bangladesh",
                                style: TextStyle(
                                  color: Colors.black,
                                  // color: Color(0xff03438C),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),

                      //Total Vaccancy
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black54,
                                width: 1
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(0xff03438C),
                                size: 18,
                              ),

                              SizedBox(
                                width: 5,
                              ),

                              Text(
                                "Vacancy: 3",
                                style: TextStyle(
                                  color: Colors.black,
                                  // color: Color(0xff03438C),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),

                      //Emploment Type Intern, part-time or full-time
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black54,
                                width: 1
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                  Icons.watch_later_outlined,
                                color: Color(0xff03438C),
                                size: 18,
                              ),

                              SizedBox(
                                width: 5,
                              ),

                              Text(
                                "Part Time",
                                style: TextStyle(
                                  color: Colors.black,
                                  // color: Color(0xff03438C),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),

                      //Workplace Type office, remote or field-Job
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black54,
                                width: 1
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [

                              Icon(
                                  Icons.monitor,
                                color: Color(0xff03438C),
                                size: 18,
                              ),

                              SizedBox(
                                width: 5,
                              ),

                              Text(
                                "Workplace: Office",
                                style: TextStyle(
                                  color: Colors.black,
                                  // color: Color(0xff03438C),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),

                      //Experienced Type Fresher, Experienced or any
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black54,
                                width: 1
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [

                              Icon(
                                  Icons.work,
                                color: Color(0xff03438C),
                                size: 18,
                              ),

                              SizedBox(
                                width: 5,
                              ),

                              Text(
                                "Experienced: Any",
                                style: TextStyle(
                                  color: Colors.black,
                                  // color: Color(0xff03438C),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),

                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
