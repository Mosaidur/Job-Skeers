import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../CustomSnackbar.dart';
import '../../../Models/Profile/ContactInfo.dart';
import '../../../loading_page.dart';
import '../widgets/No_data_found.dart';
import 'Add_Edit_Contact_Details.dart';

class Contact_details extends StatefulWidget {
  const Contact_details({super.key});

  @override
  State<Contact_details> createState() => _Contact_detailsState();
}

class _Contact_detailsState extends State<Contact_details> {


  late SharedPreferences sprefs;
  String? UserID;
  String? userName;

  String? present_address;
  String? permanent_address;
  String? primary_phone_no;

  String? secondary_phone_no;
  String? emargency_phone_no;
  String? primary_email;
  String? secondary_email;

  late bool success = false;
  String? C_Details_Id;


  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _loadUserData();
    _startPolling();
  }

  void _startPolling() {
    const pollingInterval = Duration(milliseconds: 500); // Set your desired polling interval
    _timer = Timer.periodic(pollingInterval, (timer) {
      if (UserID != null) {
        _fetchContactInfo(UserID!);
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }


  Future<void> _fetchContactInfo(String userId) async {
    LoadingPage();
    final String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Contact%20Info%20API/Read_Contact_info.php';

    final response = await http.get(
      Uri.parse('$apiUrl?user_id=$userId'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = json.decode(response.body);

      if (responseData != null) {
        success = responseData['success'];

        if (success == true) {
          ContactInfoData ContactInfoDTO = ContactInfoData.fromJson(responseData);

          setState(() {
            C_Details_Id = ContactInfoDTO.contactInfo?.contactId;
            present_address = ContactInfoDTO.contactInfo?.presentAddress;
            permanent_address = ContactInfoDTO.contactInfo?.permanentAddress;
            secondary_phone_no = ContactInfoDTO.contactInfo?.secondaryPhoneNo;
            emargency_phone_no = ContactInfoDTO.contactInfo?.emergencyPhoneNo;
            secondary_email = ContactInfoDTO.contactInfo?.secondaryEmail;
            if (C_Details_Id != null) {
              print(C_Details_Id);
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
        print('Failed to fetch personal info. Error code: ${response
            .statusCode}');

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
  }

      Future<void> _loadUserData() async {
      sprefs = await SharedPreferences.getInstance();
      setState(() {
        UserID = sprefs.getString("USERID");
        userName = sprefs.getString("USERNAME");
        primary_email = sprefs.getString("USEREMAIL");
        primary_phone_no = sprefs.getString("USERPHONENO");
        print(UserID);
        if (UserID != null) {
           _fetchContactInfo(UserID!);
        }
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

              Text("Contact Details"),


              (C_Details_Id == null || success != true) ?
              InkWell(
                onTap: () {
                  // _timer.cancel(); // Cancel the timer
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Add_Edit_Contact_Details(
                              CDetailsId: C_Details_Id = null,
                            primaryEmail: primary_email,
                            primaryPhoneNo: primary_phone_no,
                          )));
                },
                child: Icon(Icons.add_comment),
              )
                  :
              InkWell(
                onTap: () {
                  // _timer.cancel(); // Cancel the timer
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      Add_Edit_Contact_Details(
                        CDetailsId: C_Details_Id,
                        permanentAddress: permanent_address,
                        presentAddress: present_address,
                        secondaryEmail: secondary_email,
                        secondaryPhoneNo: secondary_phone_no,
                        emergencyPhoneNo: emargency_phone_no,
                        primaryEmail: primary_email,
                        primaryPhoneNo: primary_phone_no,
                      )
                  ));
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
        body: (C_Details_Id == null || success != true )? NoDataFound()
              :
        SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Address
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20, right: 20, bottom: 20),
            child: Container(
              width: double.maxFinite,
              // height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Address",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15,),

                    //Present Address
                    Text(
                      "Present Address:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      present_address!,
                      softWrap: true,
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 15,),

                    //  Permanenet Address
                    Text(
                      "Permanenet Address:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      permanent_address!,
                      softWrap: true,
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),


                    SizedBox(height: 15,),

                  ],

                ),
              ),
            ),
          ),

          //Phone Number
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20, right: 20, bottom: 20),
            child: Container(
              width: double.maxFinite,
              // height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //Phone Number
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15,),

                    //  Primary Phone Number
                    Text(
                      "Primary Phone Number:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      primary_phone_no!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 15,),

                    //  Secondary Phone Number
                    Text(
                      "Secondary Phone Number:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      secondary_phone_no!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 15,),

                    //  Emargency Phone Number
                    Text(
                      "Emargency Phone Number:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      emargency_phone_no!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 15,),

                  ],

                ),
              ),
            ),
          ),

          // Email Address
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20, right: 20, bottom: 20),
            child: Container(
              width: double.maxFinite,
              // height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //Email Address
                    Text(
                      "Email Address",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15,),

                    //  Primary Email Address
                    Text(
                      "Primary Email Address:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      primary_email!,
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),


                    SizedBox(height: 15,),

                    //  Secondary Email Address
                    Text(
                      "Secondary Email Address:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      secondary_email!,
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),


                    SizedBox(height: 15,),

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