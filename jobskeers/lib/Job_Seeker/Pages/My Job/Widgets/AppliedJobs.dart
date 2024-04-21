import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Browse Jobs/JobDetails.dart';
import '../../Browse Jobs/Widgets/Job_list_ForJOBS_page.dart';
import '../../Browse Jobs/BrowseJobsListPage.dart';

class AppliedJobs extends StatelessWidget {
  AppliedJobs({super.key});

  List appliedJobs = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        // color: Colors.blue.shade50,
        child: Column(
          children: [
            // for(int i=0 ; i<10;i++)
            (appliedJobs.isEmpty)
                ? Container(
                    // height: MediaQuery.of(context).size.height/1.5,
                    child: Column(
                      children: [
                        Image.asset("assets/Images2/AppliedJobs.png"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "No Applied Jobs Found",
                          style: TextStyle(
                            color: Color(0xff1891D9),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "You haven't applied any job yet.",
                          style: TextStyle(
                            // color: Color(0xff1891D9),
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => BrowseJobslistPage()));
                          },
                          child: Container(
                            // height: 40,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Color(0xff1891D9),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "Browse Jobs",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : JobListForJobsPage(
                    jobPostID: '',
                    Job_Title: '',
                    Company_Name: '',
                    Company_Logo: '',
                    salary: '',
                    Deadline: DateTime(2024, 4, 20),
                    Location: '',
                    Vaccancy: '',
                    Employment_Type: '',
                    Workplace_Type: '',
                    Experienced_Type: '',
                    JobPostDetailspage: JobDetails(
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
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
