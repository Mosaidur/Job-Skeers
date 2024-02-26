

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Select_LogInScreen.dart';
import '../../../CustomSnackbar.dart';

class ManuDrawer extends StatefulWidget {
  const ManuDrawer({super.key});

  @override
  State<ManuDrawer> createState() => _ManuDrawerState();
}

class _ManuDrawerState extends State<ManuDrawer> {
  // getting the value of shared preferances
  late SharedPreferences sprefs;

  String? userID;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? Studentship_Title;

  @override
  void initState() {
    super.initState();
    _load_USERID_Preferences();
  }

  _load_USERID_Preferences() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      userID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
      userEmail = sprefs.getString("USEREMAIL");
      userPhone = sprefs.getString("USERPHONENO");
      Studentship_Title = sprefs.getString("USERS_Studentship_Title");
    });
  }

  _remove_USERID_Preferences() async {
    sprefs = await SharedPreferences.getInstance();
    sprefs.remove("USERID");

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            // Center(
            //   child: Container(
            //     // height: 500,
            //     color: Colors.redAccent,
            //     child: Text(
            //       userID ?? "No UserID",
            //       style: TextStyle(
            //           fontSize: 90,
            //           fontWeight: FontWeight.bold
            //       ),
            //     ),
            //   ),
            // ),
            
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 220,
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30,45,0,15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //Image
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade100
                      ),
                      child: Image.asset("assets/icons/man_logo.png",),
                    ),
                    SizedBox(height: 10,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Name
                        Text(userName!,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 5,),

                        //Email
                        Text(userEmail!,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),

                        //Phone Number
                        Text(userPhone!,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),

                        // Studentship Title
                        Text(Studentship_Title!,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
              
                    //Account Setting
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25,20,20,15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Account Setting",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
              
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey,thickness: 1,indent: 20,endIndent: 20,),
              
                    //Event
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25,20,20,15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Events",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
              
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey,thickness: 1,indent: 20,endIndent: 20,),
              
                    //Groups
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25,20,20,15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Groups",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
              
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey,thickness: 1,indent: 20,endIndent: 20,),
              
                    //Friends
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25,20,20,15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Friends",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
              
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey,thickness: 1,indent: 20,endIndent: 20,),
              
                    //Special Offers
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25,20,20,15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Special Offers",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
              
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey,thickness: 1,indent: 20,endIndent: 20,),
              
                    SizedBox(height: 70 ,),
              
                    //Logout Button
                    ElevatedButton(
                        onPressed: ()  async {
              
                          if (userID != null) {
                            await _remove_USERID_Preferences();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SelectLoginScreen()),
                            );
                          } else {
                            // Perform logout logic here
                            Future.delayed(Duration.zero, () {
                              CustomSnackBar.show(
                                context,
                                message: 'Some unexpected issue happends',
                                backgroundColor: Colors.green.shade400,
                                // Set your desired background color
                                actionLabel: 'Logout failed.',
                                iconData: Icons.error,
                                onActionPressed: () {
                                  // Handle action press
                                  Navigator.of(context).pop; // or any other action
                                },
                              );
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade300, // Change this color to your desired color
                        ),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
              
                          ),
                        )
                    )
              
                  ],
                ),
              ),
            ),


          ],
        ),
    );
  }
}
