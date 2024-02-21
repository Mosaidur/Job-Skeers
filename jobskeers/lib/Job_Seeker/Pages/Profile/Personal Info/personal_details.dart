import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Models/Profile/personal_info.dart';
import '../widgets/No_data_found.dart';
import 'Edit_Personatl_Details.dart';

class personal_details extends StatefulWidget {
  const personal_details({super.key});

  @override
  State<personal_details> createState() => _personal_detailsState();
}

class _personal_detailsState extends State<personal_details> {

  late SharedPreferences sprefs;
  String? userID;
  String? userName;

  // Define userDTO variable at the class level
  UserDTO? userDTO;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    Personalinfo();
  }

  // Define variables to hold user information
  String? name ;
  String? father_name;
  String? mother_name;
  String? dateOfBirth;
  String? religion;
  String? gender;
  String? marital_status;
  String? nationality;
  String? nid;
  String? passport_no;
  String? passport_issue_date;
  String? blood_group;
  String? image = "assets/icons/man_logo.png";



  Future<void> Personalinfo() async {
    // Replace with actual user ID
    final url = Uri.parse('http://10.0.2.2/JobSeeker_EmpAPI/Parsonal%20Info%20API/read_personal_info.php?user_id=$userID');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        // Assign value to userDTO
        userDTO = UserDTO.fromJson(jsonResponse);
        setState(() {
          father_name = userDTO?.personalInfo?.fatherName;
          mother_name = userDTO?.personalInfo?.motherName;
          dateOfBirth = userDTO?.personalInfo?.dateOfBirth;
          religion = userDTO?.personalInfo?.religion;
          gender = userDTO?.personalInfo?.gender;
          marital_status = userDTO?.personalInfo?.maritalStatus;
          nationality = userDTO?.personalInfo?.nationality;
          nid = userDTO?.personalInfo?.nid;
          passport_no = userDTO?.personalInfo?.passportNo;
          passport_issue_date = userDTO?.personalInfo?.passportIssueDate;
          blood_group = userDTO?.personalInfo?.bloodGroup;
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }


  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      userID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
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

            Text("Personal Details"),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Personatl_Details()));
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
      body: ( userDTO == null || userDTO?.success != true )? NoDataFound() : SingleChildScrollView(
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
                        name!,
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
