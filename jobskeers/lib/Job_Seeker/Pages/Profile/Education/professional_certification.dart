import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../CustomSnackbar.dart';
import '../../../Models/Profile/CertificationsDataDTOModel.dart';
import '../../../loading_page.dart';
import '../widgets/No_data_found.dart';
import 'Add_professional_certification.dart';
import 'Add_Edit_professional_certification.dart';
import 'Widgets/data_professional_certification.dart';

class Professional_Certification extends StatefulWidget {
  const Professional_Certification({super.key});

  @override
  State<Professional_Certification> createState() => _Professional_CertificationState();
}

class _Professional_CertificationState extends State<Professional_Certification> {

  late SharedPreferences sprefs;
  String? UserID;
  String? userName;

  List<Map<String, String?>> fetchedCertificationsDataList = [];
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
    _loadUserData();
    _startPolling();
  }

  void _startPolling() {
    const pollingInterval = Duration(milliseconds: 500);
    _timer = Timer.periodic(pollingInterval, (timer) {
      if (UserID != null) {
        _fetchCertificationsData(UserID!);
      }
    });
  }

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      UserID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
      if (UserID != null) {
        _fetchCertificationsData(UserID!);
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

  // Future<void> _fetchCertificationsData (String userID) async {
  //   LoadingPage();
  //   final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Language%20Info/Read_language_info.php';
  //
  //   final response = await http.get(
  //     Uri.parse('$apiUrl?user_id=$userID'),
  //     headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic>? responseData = json.decode(response.body);
  //
  //     if (responseData != null) {
  //       success = responseData['success'];
  //
  //       if (success == true) {
  //         List<dynamic> languageSkillsJson = responseData['languageSkills'];
  //         List<LanguageSkill> languageSkills =
  //         languageSkillsJson.map((skillJson) => LanguageSkill.fromJson(skillJson)).toList();
  //
  //         setState(() {
  //           fetchedLanguageDataList = languageSkills.map((skill) => {
  //             'languageId': skill.languageId,
  //             'language': skill.language,
  //             'readingLevel': skill.readingLevel,
  //             'writingLevel': skill.writingLevel,
  //             'speakingLevel': skill.speakingLevel,
  //           }).toList();
  //         });
  //       } else {
  //         String message = responseData['message'];
  //         print('Error: $message');
  //         // _showSnackBar(message);
  //       }
  //     } else {
  //       print('Failed to fetch language skills. Error code: ${response.statusCode}');
  //       _showSnackBar('Error:- ${response.statusCode}');
  //     }
  //   }
  // }

  // Future<void> _fetchCertificationsData(String userID) async {
  //   LoadingPage();
  //   final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Certifications%20Info/Read_certifications_info.php';
  //
  //   final response = await http.get(
  //     Uri.parse('$apiUrl?user_id=$userID'),
  //     headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> responseData = json.decode(response.body);
  //
  //
  //     if (responseData != null) {
  //       success = responseData['success'];
  //
  //       if (success ==true ) {
  //         CertificationsData certificationsData = CertificationsData.fromJson(responseData);
  //         setState(() {
  //           fetchedCertificationsDataList = certificationsData.certifications!.map((cert) => {
  //             'Certification_Id': cert.certificationId,
  //             'certificationTitle': cert.certificationTitle,
  //             'instituteName': cert.instituteName,
  //             'location': cert.location,
  //             'startDate': cert.startDate,
  //             'endDate': cert.endDate,
  //           }).toList();
  //         });
  //       } else {
  //         String message = responseData['message'];
  //         print('Error: $message');
  //         _showSnackBar(message);
  //       }
  //     } else {
  //       print('Failed to fetch language skills. Error code: ${response.statusCode}');
  //       _showSnackBar('Error:- ${response.statusCode}');
  //     }
  //
  //   } else {
  //     print('Failed to fetch certifications data. Error code: ${response.statusCode}');
  //     _showSnackBar('Error:- ${response.statusCode}');
  //   }
  // }


  Future<void> _fetchCertificationsData(String userID) async {
    LoadingPage();
    final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Certifications%20Info/Read_certifications_info.php';

    final response = await http.get(
      Uri.parse('$apiUrl?user_id=$userID'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    print(UserID);

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = json.decode(response.body);

      if (responseData != null) {
        success = responseData['success']; // Check for 'success' key

        if (success == true) {
          List<dynamic> certificationsJson = responseData['certifications'];
          List<Certification> certifications = certificationsJson.map((certJson) => Certification.fromJson(certJson)).toList();

          setState(() {
            fetchedCertificationsDataList = certifications.map((cert) => {
              'Certification_Id': cert.certificationId,
              'certificationTitle': cert.certificationTitle,
              'instituteName': cert.instituteName,
              'location': cert.location,
              'startDate': cert.startDate,
              'endDate': cert.endDate,
            }).toList();
          });
        } else {
          String message = responseData['message'];
          print('Error: $message');
          // _showSnackBar(message);
        }
      } else {
        print('Failed to fetch certifications data. Error code: ${response.statusCode}');
        // _showSnackBar('Error:- ${response.statusCode}');
      }
    } else {
      print('Failed to fetch certifications data. Error code: ${response.statusCode}');
      // _showSnackBar('Error:- ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Professional Certification"),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Edit_professional_certification(Certification_Id: null)));
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
      body: ( fetchedCertificationsDataList.isEmpty || success != true )? NoDataFound() : SingleChildScrollView(
        child: Column(
          children: fetchedCertificationsDataList.map((cert) {
            return Data_Professional_Certification(
              certificationTitle: cert['certificationTitle'] !,
              instituteName: cert['instituteName'] !,
              location: cert['location'] !,
              startDate: cert['startDate'] !,
              endDate: cert['endDate'] !,
              editpage: Add_Edit_professional_certification(
                Certification_Id: cert['Certification_Id'] !,
                certificationTitle: cert['certificationTitle'] !,
                instituteName: cert['instituteName'] !,
                location: cert['location']!,
                startDate: cert['startDate'] !,
                endDate: cert['endDate'] !,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


