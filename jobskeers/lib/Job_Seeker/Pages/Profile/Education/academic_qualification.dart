import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Pages/Profile/Education/Edit_academic_qualification.dart';
import 'package:jobskeers/Job_Seeker/Pages/Profile/Education/Widgets/data_academic_qualifi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../CustomSnackbar.dart';
import '../../../Models/Profile/Read_edu_data.dart';
import '../../../loading_page.dart';
import '../widgets/No_data_found.dart';
import 'Add_academic_qualification.dart';

class AcademicQualification extends StatefulWidget {
  const AcademicQualification({Key? key});

  @override
  State<AcademicQualification> createState() => _AcademicQualificationState();
}

class _AcademicQualificationState extends State<AcademicQualification> {

  late SharedPreferences sprefs;
  String? UserID;
  String? userName;

  List<Map<String, String?>> fetchedDataList = [];

  late bool success = false;
  String? acQualificationid;

  late Timer _timer;

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();

  }

  @override
  void initState() {
    super.initState();

    _loadUserData();
    _startPolling();
  }

  void _startPolling() {
    const pollingInterval = Duration(milliseconds: 500);
    _timer = Timer.periodic(pollingInterval, (timer) {
      if (UserID != null) {
        _fetchEducationInfo(UserID!);
        print(UserID);
      }
    });
  }


  Future<void> _fetchEducationInfo(String userId) async {
    LoadingPage();
    final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Education%20History/Read_education_history.php';

    final response = await http.get(
      Uri.parse('$apiUrl?user_id=$userId'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = json.decode(response.body);

      if (responseData != null) {
        success = responseData['success'];

        if (success == true) {
          List<dynamic> educationHistoryJson = responseData['education_history'];
          List<EducationHistory> educationHistory = educationHistoryJson.map((eduJson) => EducationHistory.fromJson(eduJson)).toList();

          setState(() {
            fetchedDataList = educationHistory.map((history) => {
              'acQualificationid': history.acQualiId,
              'levelOfEdu': history.levelOfEdu,
              'degreeTitle': history.degreeTitle,
              'board': history.board,
              'group': history.groupAndMajor,
              'institutionName': history.institutionName,
              'result': history.result,
              'gpa': history.gpa,
              'passingYear': history.passingYear,
              'duration': history.duration,
            }).toList();
          });
        } else {
          String message = responseData['message'];
          print('Error: $message');
          // _showSnackBar(message);
        }
      } else {
        print('Failed to fetch personal info. Error code: ${response.statusCode}');
        _showSnackBar('Error:- ${response.statusCode}');
      }
    }
  }

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      UserID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
      print(UserID);
      if (UserID != null) {
        _fetchEducationInfo(UserID!);
      }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Academic Qualification"),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Edit_academic_qualification(acQualificationid: null)));
              },
              child: Icon(Icons.add_comment),
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
      body: (fetchedDataList.isEmpty || success != true )? NoDataFound() : SingleChildScrollView(
        child: Column(
          children: fetchedDataList.map((data) => Data_Academic_Qualification(
            levelOfEdu: data['levelOfEdu']!,
            degreeTitle: data['degreeTitle']!,
            board: data['board']!,
            group: data['group']!,
            institutionName: data['institutionName']!,
            result: data['result']!,
            gpa: data['gpa']!,
            passingYear: data['passingYear']!,
            duration: data['duration']!,
            editpage: Edit_academic_qualification(
              acQualificationid: data['acQualificationid'],
              levelOfEdu: data['levelOfEdu'],
              degreeTitle: data['degreeTitle'],
              board: data['board'],
              group: data['group'],
              institutionName: data['institutionName'],
              result: data['result'],
              gpa: data['gpa'],
              passingYear: data['passingYear'],
              duration: data['duration'],
            ),
          )).toList(),
        ),
      ),
    );
  }
}
