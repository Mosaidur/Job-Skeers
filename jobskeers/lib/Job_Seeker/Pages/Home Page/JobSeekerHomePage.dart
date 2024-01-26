import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Select_LogInScreen.dart';
import '../../Authentiction Pages/JobSeekerSign_In.dart';
import '../../CustomSnackbar.dart';
import '../Profile/Account Settings/upload_photo.dart';
import 'Widgets/HiringCategoryInRow.dart';
import 'Widgets/HomePageJobList.dart';
import 'Widgets/Main_feature.dart';
import '../Browse Jobs/BrowseJobsListPage.dart';
import 'Widgets/ManuDrawer.dart';

class JobSeekerHomePage extends StatefulWidget {
  JobSeekerHomePage({Key? key});

  @override
  State<JobSeekerHomePage> createState() => _JobSeekerHomePageState();
}

class _JobSeekerHomePageState extends State<JobSeekerHomePage> {

  String number= "99";
  String new_jobs ="100";
  String Live_jobs ="200";
  String Deadline_tomorrow = "150";


  // getting the value of shared preferances
  late SharedPreferences sprefs;
  String? userID;

  @override
  void initState() {
    super.initState();
    _load_USERID_Preferences();
  }

  _load_USERID_Preferences() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      userID = sprefs.getString("USERID");
    });
  }

  _remove_USERID_Preferences() async {
    sprefs = await SharedPreferences.getInstance();
    sprefs.remove("USERID");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
      
      
            // Hadder of the HomePage
            Container(
              width: double.maxFinite,
              height: 180,
              color: Color(0xffcae6f1),
              child: Column(
                children: [
      
      
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      children: [
      
      
                        // Image Icon
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 20.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadPhoto())  );
                            },
                            child: Container(
                              height: 50,
                              // width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle
                              ),
                              child: Image.asset("assets/icons/man_logo.png"),
                            ),
                          ),
                        ),
      
                        // Search bar
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 8.0),
                          child: Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width/2.1,
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Search"),
                                  Icon(
                                    Icons.search,
                                    color: Color(0xff03438C),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
      
                        // Notification Icon
                        InkWell(
                          onTap: (){


                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd ,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.notifications,
                                    color: Color(0xff03438C),
                                  ),
                                ),

                                Text(
                                  "${number}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                  //textAlign: TextAlign.right,
                                )

                              ],
                            ),
                          ),
                        ),
      
                        //Menu bar
                        Builder(
                            builder: (context) {
                              return IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Color(0xff03438C),
                                ),
                                onPressed: () {
                                  Scaffold.of(context).openEndDrawer();
                                },
                              );
                            }
                        )
      
                      ],
                    ),
                  ),
      
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
      
                        // New Jobs
                        Column(
                          children: [
                            Text(
                              new_jobs,
                              style: TextStyle(
                                color: Color(0xff03438C),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "New Jobs",
                              style: TextStyle(
                                color: Color(0xff03438C),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.overline,
                                decorationColor: Color(0xff03438C),
                              ),
                            ),
                          ],
                        ),
      
                        // Live Jobs
                        Column(
                          children: [
                            Text(
                              Live_jobs,
                              style: TextStyle(
                                color: Color(0xff03438C),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Live Jobs",
                              style: TextStyle(
                                color: Color(0xff03438C),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.overline,
                                decorationColor: Color(0xff03438C),
      
                              ),
                            ),
                          ],
                        ),
      
                        // Deadline Tomorrow
                        Column(
                          children: [
                            Text(
                              Deadline_tomorrow,
                              style: TextStyle(
                                color: Color(0xff03438C),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Deadline Tomorrow",
                              style: TextStyle(
                                color: Color(0xff03438C),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.overline,
                                decorationColor: Color(0xff03438C),
                              ),
                            ),
                          ],
                        ),
      
      
                      ],
                    ),
                  )
                ],
              ),
            ),
      
            //Main feature Container
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                "Main Featuers",
                style: TextStyle(
                  color: Color(0xff03438C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
      
            Mian_Feature(),
      
      
            //Hiring Category Container
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                //vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                "Hiring Category",
                style: TextStyle(
                  color: Color(0xff03438C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
      
            //HiringCategory(),
      
            HiringCategoryInRow(),
      
      
      
            //Recent Job Container
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
      
                    Text(
                      "Recent Job",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
      
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BrowseJobslistPage()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          //fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
      
                  ],
                ),
              ),
            ),
      
      
            for (int i=0 ; i<10; i++)
              HomePageJobList(),


      
          ],
        ),
      ),
      endDrawer: ManuDrawer(),
    );
  }
}
