import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../JobDetails.dart';
import '../../../Widgets/RemainingDayCount.dart';



class JobListForJobsPage extends StatefulWidget {
  final String jobPostID;
  final String Job_Title;
  final String Company_Name;
  final String Company_Logo  ;
  final String salary ;
  final DateTime Deadline ;
  final String Location;
  final String Vaccancy;
  final String Employment_Type ;
  final String Workplace_Type ;
  final String Experienced_Type ;
  final Widget JobPostDetailspage;
  JobListForJobsPage({
    super.key,
    required this.jobPostID,
    required this.Job_Title,
    required this.Company_Name,
    required this.Company_Logo ,
    required this.salary,
    required this.Deadline,
    required this.Location,
    required this.Vaccancy,
    required this.Employment_Type,
    required this.Workplace_Type,
    required this.Experienced_Type,
    required this.JobPostDetailspage,
  });

  @override
  State<JobListForJobsPage> createState() => _JobListForJobsPageState();
}

class _JobListForJobsPageState extends State<JobListForJobsPage> {

  // final String jobPostID ='';
  // final String Job_Title ='Job_Title';
  // final String Company_Name ='Company_Name';
  // final String Company_Logo ="assets/icons_2/Company logo.png";
  // final String salary ='20k - 30k';
  // final DateTime Deadline =DateTime(2024, 4, 20);
  // final String Location ="Dhaka";
  // final String Vaccancy ='2';
  // final String Emploment_Type ='Part-time';
  // final String Workplace_Type ='Office';
  // final String Experienced_Type ='Any';


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => widget.JobPostDetailspage ));
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
                            widget.Job_Title,
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
                            widget.Company_Name,
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
                      child: Image.asset((widget.Company_Logo == null) ?"assets/icons_2/Company logo.png" : widget.Company_Logo ),
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
                      "৳ ${widget.salary} BDT",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    RemainingDate(date: widget.Deadline),

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
                                widget.Location,
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
                                "Vacancy: ${widget.Vaccancy}",
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
                                widget.Employment_Type,
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
                                "Workplace: ${widget.Workplace_Type}",
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
                                "Experienced: ${widget.Experienced_Type}",
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
