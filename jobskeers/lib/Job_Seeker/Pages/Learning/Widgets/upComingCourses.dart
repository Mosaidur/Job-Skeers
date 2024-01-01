import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpComingCourse extends StatelessWidget {
  UpComingCourse({super.key});

  final String imagePath = "assets/Images2/Upcoming Course.jpg";
  final String title = "Ms Excel Course ";
  final String courseConductLocation = "Online";
  final String SessionStarting = "9-22 January 2024 (6th session)";


  final String SugImagePath = "assets/Images2/Upcoming Course.jpg";
  final String Sugtitle = "Ms Excel Course ";
  final String SugcourseConductLocation = "Online";
  final String SugSessionStarting = "9-22 January 2024 (6th session)";





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          // Suggested Courses
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.only(top: 10.0, left: 20,right: 10,bottom: 10),
            child: Text(
              "Suggested Learning Material",
              style: TextStyle(
                color: Color(0xff03438C),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [


                for(int i=0; i<10;i++)


                InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 20,bottom: 10),
                    child: Container(
                      // width: double.maxFinite,
                      width: MediaQuery.of(context).size.width/2.5,
                      //height: 700,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue.shade50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //Image
                            Container(
                              width: MediaQuery.of(context).size.width/2.5,
                              child: Image.asset(SugImagePath, fit: BoxFit.fill,),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            // title
                            Text(
                              Sugtitle,
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
                                    SugcourseConductLocation,
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
                                    SugSessionStarting,
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
                ),

              ],
            ),
          ),



          // All Courses
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.only(top: 10.0, left: 20,right: 10,bottom: 10),
            child: Text(
              "All Learning Material",
              style: TextStyle(
                color: Color(0xff03438C),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          for(int i=0; i<10;i++)
          Row(
            children: [

              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 10),
                  child: Container(
                    // width: double.maxFinite,
                    width: MediaQuery.of(context).size.width/2.5,
                    //height: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.shade50,
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
              ),

              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20,right: 15,bottom: 10),
                  child: Container(
                    // width: double.maxFinite,
                    width: MediaQuery.of(context).size.width/2.5,
                    //height: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.shade50,
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
              ),


            ],
          ),


        ],


      ),
    );
  }
}
