import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Add_Edit_academic_qualification.dart';

class Data_Academic_Qualification extends StatelessWidget {

  final String levelOfEdu;
  final String degreeTitle;
  final String board;
  final String group;
  final String institutionName;
  final String result;
  final String gpa;
  final String passingYear;
  final String duration;
  final Widget editpage;

  const Data_Academic_Qualification(
      {super.key,
    required this.levelOfEdu,
    required this.degreeTitle,
    required this.board,
    required this.group,
    required this.institutionName,
    required this.result,
    required this.gpa,
    required this.passingYear,
    required this.duration, required this.editpage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // for (int i=0; i<3;i++ )
        //Academic Qualification
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

                  // Level of Education
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        child: Text(
                          levelOfEdu,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>editpage ));
                        },
                        child: Icon(Icons.edit_note_sharp),
                      )

                    ],
                  ),
                  SizedBox(height: 15,),

                  //Degree Title
                  Text(
                    "Degree Title:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    degreeTitle,
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

                  //  Board
                  Text(
                    "Board:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    board,
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

                  //  Group
                  Text(
                    "Group:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    group,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Insititute Name
                  Text(
                    "Insititute Name:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    institutionName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Result
                  Text(
                    "Result:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    result,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  GPA
                  Text(
                    "GPA:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    gpa,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Passing Year
                  Text(
                    "Passing Year:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    passingYear,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Duration
                  Text(
                    "Duration:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    duration,
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
    );
  }
}
