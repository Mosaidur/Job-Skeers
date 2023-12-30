import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RemainingDayCount.dart';

class HomePageJobList extends StatefulWidget {
  const HomePageJobList({super.key});

  @override
  State<HomePageJobList> createState() => _HomePageJobListState();
}

class _HomePageJobListState extends State<HomePageJobList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          //color: Color(0xffcae6f1),
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [

            //Job title , Company name & Company logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Job title and Company name Ciontainer
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Job Title",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      Text(
                        "Company Name",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0,top: 15.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/icons_2/Company logo.png"),
                  ),
                )
              ],
            ),

            //Salary & Deadline Remaining date
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                //vertical: 15,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "৳ 20k - 30k BDT",
                    style: TextStyle(
                      color: Color(0xff03438C),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  RemainingDate(),

                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),

            //address & Vacancy
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                //vertical: 15,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  //Address Office
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xff03438C),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Dhaka,Bangladesh",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          //fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),


                  //Total Vaccancy
                  Text(
                    "Vacancy: 3",
                    style: TextStyle(
                      color: Color(0xff03438C),
                      //fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
