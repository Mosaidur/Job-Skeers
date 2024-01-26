import 'package:flutter/material.dart';

import 'Add_emp_history.dart';
import 'Edit_emp_history.dart';

class Employe_History extends StatefulWidget {
  const Employe_History({super.key});

  @override
  State<Employe_History> createState() => _Employe_HistoryState();
}

class _Employe_HistoryState extends State<Employe_History> {


  final String Company_Name = " ";
  final String Company_Business = " ";
  final String Company_Location = " ";
  final String Company_Designation = " ";
  final String Company_Department = " ";
  final String Company_Responsibilities = " ";
  final String Start_Date = " ";
  final String End_Date = " ";
  final String AreaOfExpertiese = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Employe History"),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_emp_history() ));
              },
              child: Icon(Icons.add_comment),
              // Icon(Icons.edit_note_sharp),
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
      body: SingleChildScrollView(
        child: Column(
          children: [

            //Employe History
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

                      // Company Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Company_Name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Edit_emp_history() ));
                            },
                            child: Icon(Icons.edit_note_sharp),
                          )

                        ],
                      ),
                      SizedBox(height: 15,),

                      //Company Business
                      Text(
                        "Company Business",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        Company_Business,
                        textAlign: TextAlign.justify,
                        // softWrap: true,
                        // maxLines: 15,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 15,),

                      // Company Location
                      Text(
                        "Company Location",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        Company_Location,
                        textAlign: TextAlign.justify,
                        // softWrap: true,
                        // maxLines: 15,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 15,),

                      //Here your Designation
                      Text(
                        "Designation in Company",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        Company_Designation,
                        textAlign: TextAlign.justify,
                        // softWrap: true,
                        // maxLines: 15,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 15,),


                      // Department you Worked
                      Text(
                        "Department you Worked in Company",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        Company_Department,
                        textAlign: TextAlign.justify,
                        // softWrap: true,
                        // maxLines: 15,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 15,),

                      // Responsibilities
                      Text(
                        "Company Responsibilities",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        Company_Responsibilities,
                        textAlign: TextAlign.justify,
                        // softWrap: true,
                        // maxLines: 15,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 15,),

                      // Start Date
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Star Date: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: Start_Date,
                              style: TextStyle(
                                color: Colors.black, // You can customize the style for additional text
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15,),

                      //End Date
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "End Date: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: End_Date,
                              style: TextStyle(
                                color: Colors.black, // You can customize the style for additional text
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),


                      // Please enter your Area of Expertise
                      Text(
                        "Area of Expertise",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        AreaOfExpertiese,
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        maxLines: 30,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
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
