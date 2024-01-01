import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpComingCourse extends StatelessWidget {
  UpComingCourse({super.key});

  final String imagePath = "assets/Images2/Upcoming Course.jpg";
  final String title = "Ms Excel Course ";
  final String courseConductLocation = "Online";
  final String SessionStarting = "9-22 January 2024 (6th session)";

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [



        // Best Selling Courses
        Row(
          children: [
            Column(
              children: [

              ],
            )
          ],
        ),


        // Suggested Courses
        Row(
          children: [
            Column(
              children: [

              ],
            )
          ],
        ),


        Row(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
              child: Container(
                // width: double.maxFinite,
                width: MediaQuery.of(context).size.width/2.5,
                //height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //Image
                      Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Image.asset(imagePath, fit: BoxFit.fill,),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // title
                      Text(
                        title,
                        softWrap: true,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10,),

                      // course Conduct Location
                      Row(
                        children: [

                          Icon(Icons.location_on,color: Color(0xff03438C),size: 12,),

                          SizedBox(width: 10,),

                          Container(
                            width: MediaQuery.of(context).size.width/4.1,
                            child: Text(
                              courseConductLocation,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),


                        ],
                      ),

                      SizedBox(height: 10,),

                      // Session Starting Time
                      Row(
                        children: [

                          Icon(Icons.calendar_month,color: Color(0xff03438C),size: 12,),

                          SizedBox(width: 10,),

                          Container(
                            width: MediaQuery.of(context).size.width/4.1,
                            child: Text(
                              SessionStarting,
                              softWrap: true,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),


                        ],
                      ),


                    ],

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
              child: Container(
                // width: double.maxFinite,
                width: MediaQuery.of(context).size.width/2.5,
                //height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //Image
                      Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Image.asset(imagePath, fit: BoxFit.fill,),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // title
                      Text(
                        title,
                        softWrap: true,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10,),

                      // course Conduct Location
                      Row(
                        children: [

                          Icon(Icons.location_on,color: Color(0xff03438C),size: 12,),

                          SizedBox(width: 10,),

                          Container(
                            width: MediaQuery.of(context).size.width/4.1,
                            child: Text(
                              courseConductLocation,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),


                        ],
                      ),

                      SizedBox(height: 10,),

                      // Session Starting Time
                      Row(
                        children: [

                          Icon(Icons.calendar_month,color: Color(0xff03438C),size: 12,),

                          SizedBox(width: 10,),

                          Container(
                            width: MediaQuery.of(context).size.width/4.1,
                            child: Text(
                              SessionStarting,
                              softWrap: true,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),


                        ],
                      ),


                    ],

                  ),
                ),
              ),
            ),


          ],
        ),


      ],


    );
  }
}
