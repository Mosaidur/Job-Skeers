import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../CustomSnackbar.dart';
import '../../Models/Job posts/All_jobPostsDataModelDTO.dart';
import '../../Widgets/CoustomAppBar.dart';
import '../../loading_page.dart';
import '../Profile/widgets/No_data_found.dart';
import 'JobDetails.dart';
import 'Widgets/Job_list_ForJOBS_page.dart';

class BrowseJobslistPage extends StatefulWidget {
  const BrowseJobslistPage({super.key});

  @override
  State<BrowseJobslistPage> createState() => _BrowseJobslistPageState();
}

class _BrowseJobslistPageState extends State<BrowseJobslistPage> {
  List<Map<String, String?>> fetchedJobPostDataList = [];
  late bool success = false;
  late String? Certification_Id;

  late Timer _timer;

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    // if (_timer != null) {
    //   _timer.cancel();
    // }
  }

  @override
  void initState() {
    super.initState();
    _startPolling();
  }

  void _startPolling() {
    const pollingInterval = Duration(milliseconds: 500);
    _timer = Timer.periodic(pollingInterval, (timer) {
      _fetchJobPostsData();
    });
  }

  void _showSnackBar(String message) {
    Future.delayed(Duration.zero, () {
      CustomSnackBar.show(
        context,
        message: message,
        backgroundColor: Colors.red.shade400,
        actionLabel: 'Error!',
        iconData: Icons.done,
        onActionPressed: () {
          Navigator.of(context).pop();
        },
      );
    });
  }

  Future<void> _fetchJobPostsData() async {
    LoadingPage();
    final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Job_posts/All_Job_post.php';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = json.decode(response.body);

      if (responseData != null) {
        // Check for 'success' key
        if (responseData.containsKey('success')) {
          success = responseData['success'] as bool;

          if (success == true) {
            // Check for 'job_posts' list
            if (responseData.containsKey('job_posts')) {
              final List<dynamic> jobPostsJson = responseData['job_posts'];
              final List<JobPost> jobPosts =
              jobPostsJson.map((jobJson) => JobPost.fromJson(jobJson)).toList();

              setState(() {
                fetchedJobPostDataList = jobPosts
                    .map((jobPost) => {
                  'job_id': jobPost.jobId,
                  'company_name': jobPost.company_name,
                  'job_title': jobPost.jobTitle,
                  'workplace_type': jobPost.workplaceType,
                  'job_type': jobPost.jobType,
                  'salary': jobPost.salary,
                  'job_description': jobPost.jobDescription,
                  'job_responsibilities': jobPost.jobResponsibilities,
                  'job_requirement': jobPost.jobRequirement,
                  'additional_requirement': jobPost.additionalRequirement,
                  'vacancies': jobPost.vacancies,
                  'employment_type': jobPost.employmentType,
                  'gender': jobPost.gender,
                  'experience': jobPost.experience,
                  'benefits': jobPost.benefits,
                  'deadline': jobPost.deadline,
                  'publish_status': jobPost.publishStatus,
                  'read_before_apply': jobPost.readBeforeApply,
                })
                    .toList();
              });
            } else {
              print('Error: job_posts key not found in response.');
            }
          } else {
            String message = responseData['message'];
            print('Error: $message');
            _showSnackBar(message);
          }
        } else {
          print('Error: success key not found in response.');
        }
      } else {
        print(
            'Failed to fetch certifications data. Error code: ${response.statusCode}');
        _showSnackBar('Error:- ${response.statusCode}');
      }
    } else {
      print(
          'Failed to fetch certifications data. Error code: ${response.statusCode}');
      _showSnackBar('Error:- ${response.statusCode}');
    }
  }

  // Future<void> _fetchJobPostsData() async {
  //   LoadingPage();
  //   final String apiUrl =
  //       'http://10.0.2.2/JobSeeker_EmpAPI/Job_posts/All_Job_post.php';
  //
  //   final response = await http.get(
  //     Uri.parse(apiUrl),
  //     headers: {'Content-Type': 'application/json'},
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic>? responseData = json.decode(response.body);
  //
  //     if (responseData != null) {
  //       success = responseData['success']; // Check for 'success' key
  //
  //       if (success == true) {
  //         final List<dynamic> jobPostsJson = responseData['job_posts'];
  //         final List<JobPost> jobPosts = jobPostsJson.map((jobJson) => JobPost.fromJson(jobJson)).toList();
  //
  //         setState(() {
  //           fetchedJobPostDataList = jobPosts
  //               .map((jobPost) => {
  //                     'job_id': jobPost.jobId.toString(),
  //                     'company_name': jobPost.company_name,
  //                     'job_title': jobPost.jobTitle,
  //                     'workplace_type': jobPost.workplaceType,
  //                     'job_type': jobPost.jobType,
  //                     'salary': jobPost.salary,
  //                     'job_description': jobPost.jobDescription,
  //                     'job_responsibilities': jobPost.jobResponsibilities,
  //                     'job_requirement': jobPost.jobRequirement,
  //                     'additional_requirement': jobPost.additionalRequirement,
  //                     'vacancies': jobPost.vacancies,
  //                     'employment_type': jobPost.employmentType,
  //                     'gender': jobPost.gender,
  //                     'experience': jobPost.experience,
  //                     'benefits': jobPost.benefits,
  //                     'deadline': jobPost.deadline,
  //                     'publish_status': jobPost.publishStatus,
  //                     'read_before_apply': jobPost.readBeforeApply,
  //                   })
  //               .toList();
  //         });
  //       } else {
  //         String message = responseData['message'];
  //         print('Error: $message');
  //         // _showSnackBar(message);
  //       }
  //     } else {
  //       print(
  //           'Failed to fetch certifications data. Error code: ${response.statusCode}');
  //       // _showSnackBar('Error:- ${response.statusCode}');
  //     }
  //   } else {
  //     print(
  //         'Failed to fetch certifications data. Error code: ${response.statusCode}');
  //     // _showSnackBar('Error:- ${response.statusCode}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text("JOBS"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: (fetchedJobPostDataList.isEmpty || success != true)
          ? NoDataFound()
          : SingleChildScrollView(
              child: Column(
                children: fetchedJobPostDataList.map((jobPost) {
                  return JobListForJobsPage(
                    jobPostID: jobPost['job_id']!,
                    Job_Title: jobPost['job_title']!,
                    Company_Name: jobPost['company_name']!,
                    Company_Logo: '',
                    salary: jobPost['salary']!,
                    Deadline: DateTime.parse(jobPost['deadline']! ),
                    Location: '',
                    Vaccancy: jobPost['vacancies']!,
                    Employment_Type: jobPost['employment_type']!,
                    Workplace_Type: jobPost['workplace_type']!,
                    Experienced_Type: jobPost['experience']!,

                    JobPostDetailspage: JobDetails(
                      jobPostID: jobPost['job_id']!,
                      Job_Title: jobPost['job_title']!,
                      Company_Name: jobPost['company_name']!,
                      Company_Logo: '',
                      salary: jobPost['salary']!,
                      Deadline: DateTime.parse(jobPost['deadline']!),
                      Location: '',
                      Vacancy: jobPost['vacancies']!,
                      Employment_Type: jobPost['employment_type']!,
                      Workplace_Type: jobPost['workplace_type']!,
                      Experienced_Type: jobPost['experience']!,
                      job_type: jobPost['job_type']!,
                      job_description: jobPost['job_description']!,
                      job_responsibilities: jobPost['job_responsibilities']!,
                      job_requirement: jobPost['job_requirement']!,
                      additional_requirement: jobPost['additional_requirement']!,
                      gender: jobPost['gender']!,
                      benefits: jobPost['benefits']!,
                      publish_status: jobPost['publish_status']!,
                      read_before_apply: jobPost['read_before_apply']!,
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
