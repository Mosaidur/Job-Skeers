import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class JobSeekerHompage extends StatefulWidget {
  const JobSeekerHompage({super.key});

  @override
  State<JobSeekerHompage> createState() => _JobSeekerHompageState();
}

class _JobSeekerHompageState extends State<JobSeekerHompage> {

  String number= "99";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [


          // Hadder of the HomePage
          Container(
            width: double.maxFinite,
            height: 200,
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
                        child: Container(
                          height: 70,
                          // width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: Image.asset("assets/icons/man_logo.png"),
                        ),
                      ),

                      // Search bar
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right: 8.0),
                        child: Container(
                          height: 20,
                          width: 170,
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
                      Padding(
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

                      // Padding(
                      //   padding: const EdgeInsets.all(15.0),
                      //   child: Icon(
                      //     Icons.menu,
                      //     color: Color(0xff03438C),
                      //   ),
                      // )


                    ],
                  ),
                ),
              ],
            ),
          ),






        ],
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                color: Colors.redAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
