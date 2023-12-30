
import 'package:flutter/material.dart';

import '../Widgets/JobDescription.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text("Job Details"),

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            //Cover Photo and Company Logo
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                    height: 150,
                      width: double.maxFinite,
                    child: Image(
                        image: AssetImage("assets/Images2/Company_CoverPhoto.jpg"),
                    fit: BoxFit.cover,
                    ),
              ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage ("assets/icons_2/Company logo.png"),
                    fit: BoxFit.fill,
                    ),
                  ),
                ),
              ]
            ),

            Container(
              //height: 350,
              width: double.maxFinite,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Company Name
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                      child: Text(
                          "Company Name",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                    ),

                    //Job Title
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                      child: Text(
                        "Job title",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Salary and location
                    Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "Salary",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),

                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "8000-15000 BDT",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Text(
                                  "Location",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),

                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Text(
                                  "Mirpur, Dhaka, Bangladesh",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                    // Gender and Employment Type
                    Row(
                      children: [

                        //Gender
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "Gender",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),

                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "Female",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Employment Type
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Text(
                                  "Employment Type",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),

                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Text(
                                  "Part Time",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                    // Experience and Workplace Type
                    Row(
                      children: [

                        //Experience
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "Experience",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),

                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "2-5 Years",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Workplace Type
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Text(
                                  "Workplace Type",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),

                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Text(
                                  "Office",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                    // Vacancies and Deadline
                    Row(
                      children: [

                        //Posted at
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "Vacancies",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),

                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  "3",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Deadline Date
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Text(
                                  "Deadline Date",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),

                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Text(
                                  "16/01/2024",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),

            JobDescription(
              Education_level: '',
              Job_Description: '',
              Job_Responsibilities: '',
              Job_reuirements: '',
              Additional_reuirements: '',
              Salary_Benifits: '',
              Additional_info: '',
              Read_Before_apply: '',)


          ],
        ),
      ),
    );
  }
}
