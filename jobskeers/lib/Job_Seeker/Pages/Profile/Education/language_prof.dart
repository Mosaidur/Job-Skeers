import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../CustomSnackbar.dart';
import '../../../Models/Profile/LanguageSkillModel.dart';
import '../../../loading_page.dart';
import '../widgets/No_data_found.dart';
import 'Add_language_prof.dart';
import 'Add_Edit_language_prof.dart';
import 'Widgets/data_language_prof.dart';

class LanguageProficiency extends StatefulWidget {
  const LanguageProficiency({super.key});

  @override
  State<LanguageProficiency> createState() => _LanguageProficiencyState();
}

class _LanguageProficiencyState extends State<LanguageProficiency> {

  late SharedPreferences sprefs;
  String? UserID;
  String? userName;

  List<Map<String, String?>> fetchedLanguageDataList = [];
  late bool success = false;
  late String? acQualificationid;

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
        _fetchLanguageSkills(UserID!);
      }
    });
  }

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      UserID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
      if (UserID != null) {
        _fetchLanguageSkills(UserID!);
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


  Future<void> _fetchLanguageSkills(String userID) async {
    LoadingPage();
    final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Language%20Info/Read_language_info.php';

    final response = await http.get(
      Uri.parse('$apiUrl?user_id=$userID'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = json.decode(response.body);

      if (responseData != null) {
        success = responseData['success'];

        if (success == true) {
          List<dynamic> languageSkillsJson = responseData['languageSkills'];
          List<LanguageSkill> languageSkills =
          languageSkillsJson.map((skillJson) => LanguageSkill.fromJson(skillJson)).toList();

          setState(() {
            fetchedLanguageDataList = languageSkills.map((skill) => {
              'languageId': skill.languageId,
              'language': skill.language,
              'readingLevel': skill.readingLevel,
              'writingLevel': skill.writingLevel,
              'speakingLevel': skill.speakingLevel,
            }).toList();
          });
        } else {
          String message = responseData['message'];
          print('Error: $message');
          // _showSnackBar(message);
        }
      } else {
        print('Failed to fetch language skills. Error code: ${response.statusCode}');
        _showSnackBar('Error:- ${response.statusCode}');
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Language Proficiency"),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_Edit_language_prof (languageId: null,)));
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
      body: (fetchedLanguageDataList.isEmpty || success != true )? NoDataFound() : SingleChildScrollView(
        child: Column(
          children: fetchedLanguageDataList.map((data) => Data_language_prof(
            language: data['language']!,
            readingLevel: data['readingLevel']!,
            writingLevel: data['writingLevel']!,
            speakingLevel: data['speakingLevel']!,
            editpage: Add_Edit_language_prof(
              languageId: data['languageId']!,
              language: data['language']!,
              readingLevel: data['readingLevel']!,
              writingLevel: data['writingLevel']!,
              speakingLevel: data['speakingLevel']!,
            ),
          )).toList(),
        ),
      ),
    );
  }
}
