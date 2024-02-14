import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Account Settings/upload_photo.dart';
import 'widgets/InformationPart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JobSeekerProfilePage extends StatefulWidget {
  const JobSeekerProfilePage({super.key});

  @override
  State<JobSeekerProfilePage> createState() => _JobSeekerProfilePageState();
}

class _JobSeekerProfilePageState extends State<JobSeekerProfilePage> {

  late SharedPreferences sprefs;
  String? userID;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? Studentship_Title;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      userID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
      userEmail = sprefs.getString("USEREMAIL");
      userPhone = sprefs.getString("USERPHONENO");
      Studentship_Title = sprefs.getString("USERS_Studentship_Title");
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            //Hader section with Profile picture
            Container(
              width: double.maxFinite,
              // height: 180,
              color: Colors.blue.shade300,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0,left: 20,bottom: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    //profile Photo
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadPhoto())  );
                      },
                      child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/icons/man_logo.png"),
                                              ),
                    ),

                    // SizedBox(width: 15,),


                    //Name, Email & phone Number
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Name
                              Text(
                                userName ?? "",
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 10,),

                              //Email
                              Row(
                                children: [
                                  Icon(Icons.mail_rounded, color: Colors.white, size: 15,),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.8,
                                    child: Text(
                                      userEmail?? "",
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),

                              //Phone Number
                              Row(
                                children: [
                                  Icon(Icons.phone, color: Colors.white, size: 15,),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.8,
                                    child: Text(
                                      userPhone?? "",
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),

                              //Studentship Title
                              Row(
                                children: [
                                  Icon(Icons.school, color: Colors.white, size: 15,),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.8,
                                    child: Text(
                                      Studentship_Title?? "",
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
                      )



          ],
                ),
              )
            ),

            //Infomation part
            ProfileInformatioPage(),

          ],
        ),
      ),
    );
  }
}
