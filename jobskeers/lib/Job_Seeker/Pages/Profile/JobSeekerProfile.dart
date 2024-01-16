import 'package:flutter/material.dart';

import 'Account Settings/upload_photo.dart';
import 'widgets/InformationPart.dart';

class JobSeekerProfilePage extends StatelessWidget {
  const JobSeekerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    final String name= "Mosaidur Rahman Asif";
    final String email= "mosaidurrahmanasif@gamil.com";
    final String Phone_No = "+8801568219379";

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
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      
                            //Name
                            Text(
                              name,
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                      
                            SizedBox(height: 10,),
                      
                            //Email
                            Row(
                              children: [
                                Icon(Icons.mail_rounded,color: Colors.white,size: 15,),
                                SizedBox(width: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.width/1.8,
                                  child: Text(
                                    email,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      
                            SizedBox(height: 10,),
                      
                            //Phone Number
                            Row(
                              children: [
                                Icon(Icons.phone,color: Colors.white,size: 15,),
                                SizedBox(width: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.width/1.8,
                                  child: Text(
                                    Phone_No,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15
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
