import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../CustomSnackbar.dart';
import '../../../Models/Profile/personal_info.dart';
import '../../../loading_page.dart';
import '../widgets/No_data_found.dart';
import 'Add_Edit_parsonal_info.dart';

class personal_details extends StatefulWidget {
  const personal_details({super.key});

  @override
  State<personal_details> createState() => _personal_detailsState();
}

class _personal_detailsState extends State<personal_details> {



  late SharedPreferences sprefs;
  String? UserID;
  String? userName;

  late bool success = false;

  String? P_Details_Id;
  String? father_name = '';
  String? mother_name = '';
  String? dateOfBirth = '';
  String? religion = '';
  String? gender = '';
  String? marital_status = '';
  String? nationality = '';
  String? nid = '';
  String? passport_no = '';
  String? passport_issue_date = '';
  String? blood_group = '';

  String? image = "assets/icons/man_logo.png";

  late Timer _timer;

  Future<void> _fetchPersonalInfo(String userId) async {
    LoadingPage();
    final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Parsonal%20Info%20API/read_personal_info.php';

    final response = await http.get(
      Uri.parse('$apiUrl?user_id=$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      success = responseData['success']  ;

      if (success==true) {
        // Successfully fetched personal info
        // final personalInfoData = responseData['personal_info'];

        // Parse the personal info data into PersonalInfoDTO
        PersonalData personalInfoDTO = PersonalData.fromJson(responseData);

        setState(() {
          P_Details_Id = personalInfoDTO.personalInfo?.pDetailsId;
          father_name = personalInfoDTO.personalInfo?.fatherName;
          mother_name = personalInfoDTO.personalInfo?.motherName;
          dateOfBirth = personalInfoDTO.personalInfo?.dateOfBirth;
          religion = personalInfoDTO.personalInfo?.religion;
          gender = personalInfoDTO.personalInfo?.gender;
          marital_status = personalInfoDTO.personalInfo?.maritalStatus;
          nationality = personalInfoDTO.personalInfo?.nationality;
          nid = personalInfoDTO.personalInfo?.nid;
          passport_no = personalInfoDTO.personalInfo?.passportNo;
          passport_issue_date = personalInfoDTO.personalInfo?.passportIssueDate;
          blood_group = personalInfoDTO.personalInfo?.bloodGroup;
          if (P_Details_Id != null) {
            print(P_Details_Id);
          }
        });
      } else {
        // User not found or other error occurred
        String message = responseData['message'];
        print('Error: $message');

        // Future.delayed(Duration.zero, () {
        //   CustomSnackBar.show(
        //     context,
        //     message: responseData['message'],
        //     backgroundColor: Colors.red.shade400, // Set your desired background color
        //     actionLabel: 'Error!',
        //     iconData: Icons.done,
        //     onActionPressed: () {
        //       // Handle action press
        //       Navigator.of(context).pop; // or any other action
        //     },
        //   );
        // });

      }
    } else {
      // Request failed
      print('Failed to fetch personal info. Error code: ${response.statusCode}');

      Future.delayed(Duration.zero, () {
        CustomSnackBar.show(
          context,
          message: 'Error:- ${response.statusCode}',
          backgroundColor: Colors.red.shade400, // Set your desired background color
          actionLabel: 'Error!',
          iconData: Icons.done,
          onActionPressed: () {
            // Handle action press
            Navigator.of(context).pop; // or any other action
          },
        );
      });

    }
  }

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      UserID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
      print(UserID);
      if (UserID != null) {
        _fetchPersonalInfo(UserID!);
      }
    });
  }

  void _startPolling() {
    const pollingInterval = Duration(milliseconds: 500); // Set your desired polling interval
    _timer = Timer.periodic(pollingInterval, (timer) {
      if (UserID != null) {
        _fetchPersonalInfo(UserID!);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _startPolling();
  }

  @override
  void dispose() {
    // _contactInfoStreamController.close();
    super.dispose();
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Personal Details"),

            (P_Details_Id == null || success != true )?
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Edit_Personatl_Details(pDetailsId: null)));
              },
              child: Icon(Icons.add_comment),
            )
            :
            InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    Add_Edit_Personatl_Details(
                      pDetailsId: P_Details_Id,
                      father_name: father_name,
                      mother_name: mother_name,
                      dateOfBirth: dateOfBirth,
                      religion: religion,
                      gender: gender,
                      marital_status: marital_status,
                      nationality: nationality,
                      nid: nid,
                      passport_no: passport_no,
                      passport_issue_date: passport_issue_date,
                      blood_group: blood_group,
                    )));
              },
              child: Icon(Icons.edit_note_sharp),
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
      body: (P_Details_Id == null || success != true )? NoDataFound() :  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 20,),

            Center(child: InkWell(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Image.asset(image!),
              ),
            ),
            ),

            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20,right: 20,bottom: 20),
              child: Container(
                width: double.maxFinite,
                // height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        userName!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15,),

                      //Father's Name
                      Text(
                        "Father's Name:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        father_name!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      SizedBox(height: 15,),

                      //  Mothers's Name
                      Text(
                        "Mothers's Name:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        mother_name!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),


                      SizedBox(height: 15,),

                      //  Date Of Birth Name
                      Text(
                        "Date of Birth:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        dateOfBirth!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      SizedBox(height: 15,),

                      //  religion
                      Text(
                        "Religion:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        religion!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      SizedBox(height: 15,),

                      //  Gender
                      Text(
                        "Gender:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        gender!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),


                      SizedBox(height: 15,),

                      //  Marital Status
                      Text(
                        "Marital Status:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        marital_status!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),


                      SizedBox(height: 15,),

                      //  Nationality
                      Text(
                        "Nationality:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        nationality!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),


                      SizedBox(height: 15,),

                      //  National ID No
                      Text(
                        "National ID No:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        nid!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      SizedBox(height: 15,),

                      //  Passport Number
                      Text(
                        "Passport Number:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        passport_no!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),


                      SizedBox(height: 15,),

                      //  Passport Issue Date
                      Text(
                        "Passport Issue Date:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        passport_issue_date!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),


                      SizedBox(height: 15,),

                      //  Blood Group
                      Text(
                        "Blood Group:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        blood_group!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
