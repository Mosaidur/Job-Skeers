import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Browse Jobs/JobDetails.dart';
import '../../../Widgets/RemainingDayCount.dart';

class HomePageJobList extends StatefulWidget {
  const HomePageJobList({super.key});

  @override
  State<HomePageJobList> createState() => _HomePageJobListState();
}

class _HomePageJobListState extends State<HomePageJobList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetails(

          jobPostID: "jobPost['job_id']!",
          Job_Title: "jobPost['job_title']!",
          Company_Name: "jobPost['company_name']!",
          Company_Logo: '',
          salary: "jobPost['salary']!",
          Deadline: DateTime(2024, 5, 5),
          Location: '',
          Vacancy: "jobPost['vacancies']!",
          Employment_Type: "jobPost['employment_type']!",
          Workplace_Type: "jobPost['workplace_type']!",
          Experienced_Type: "jobPost['experience']!",
          job_type: '',
          job_description: '',
          job_responsibilities: '',
          job_requirement: '',
          additional_requirement: '',
          gender: '',
          benefits: '',
          publish_status: '',
          read_before_apply: '',
        ) ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            //color: Color(0xffcae6f1),
            color: Colors.blue.shade50,
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
                    width: MediaQuery.of(context).size.width/3,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Job Title",
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        Text(
                          "Company Name",
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
                        color: Color(0xff03438C),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    RemainingDate(date: DateTime(2024, 4, 30)),

                  ],
                ),
              ),

              SizedBox(
                height: 5,
              ),

              //address & Vacancy
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  //vertical: 15,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    //Address Office
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xff03438C),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Dhaka,Bangladesh",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),


                    //Total Vaccancy
                    Text(
                      "Vacancy: 3",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        //fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),


                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
