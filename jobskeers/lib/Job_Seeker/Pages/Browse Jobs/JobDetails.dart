
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Widgets/JobDescription.dart';

class JobDetails extends StatefulWidget {
  final String jobPostID;
  final String Job_Title;
  final String Company_Name;
  final String Company_Logo ;
  final String salary ;
  final DateTime Deadline ;
  final String Location;
  final String Vacancy;
  final String Employment_Type ;
  final String Workplace_Type ;
  final String Experienced_Type ;

  final String job_type;
  final String job_description ;
  final String job_responsibilities ;
  final String job_requirement;
  final String additional_requirement ;
  final String gender ;
  final String benefits ;
  final String publish_status;
  final String read_before_apply;

  const JobDetails({super.key,
    required this.jobPostID,
    required this.Job_Title,
    required this.Company_Name,
    required this.Company_Logo,
    required this.salary,
    required this.Deadline,
    required this.Location,
    required this.Vacancy,
    required this.Employment_Type,
    required this.Workplace_Type,
    required this.Experienced_Type,
    required this.job_type,
    required this.job_description,
    required this.job_responsibilities,
    required this.job_requirement,
    required this.additional_requirement,
    required this.gender,
    required this.benefits,
    required this.publish_status,
    required this.read_before_apply});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Job Details"),

            IconButton(
              icon: isFavorite ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border,),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            )

          ],
        ),

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
                        widget.Company_Name,
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
                        widget.Job_Title,
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
                                  widget.salary,
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
                                  widget.Location,
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
                                  widget.gender,
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
                                  "Employment Type" ,
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
                                  widget.Employment_Type,
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
                                  "Experience" ,
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
                                  widget.Experienced_Type ,
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
                                  "Workplace Type" ,
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
                                  widget.Workplace_Type,
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

                        //Vacancy
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
                                child: Text(widget.Vacancy,
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
                                  DateFormat.yMMMd().format(widget.Deadline),
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
              Education_level: "",
              Job_Description: widget.job_description ,
              Job_Responsibilities: widget.job_responsibilities ,
              Job_reuirements: widget.job_requirement,
              Additional_reuirements: widget.additional_requirement ,
              Salary_Benifits: widget.benefits ,
              Additional_info: "Job Type \n ${widget.job_type}",
              Read_Before_apply: widget.read_before_apply,)


          ],
        ),
      ),
    );
  }
}
