import 'package:flutter/material.dart';

import 'Add_skills.dart';
import 'Edit_skills.dart';

class SkillsInformation extends StatefulWidget {
  const SkillsInformation({super.key});

  @override
  State<SkillsInformation> createState() => _SkillsInformationState();
}

class _SkillsInformationState extends State<SkillsInformation> {
  @override
  Widget build(BuildContext context) {

    final String skillsTitle= " ";
    final String skilsDescription= " ";
    final String extraCurricularAct= " ";
    final String learnedFrom = " ";



    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Skills Information"),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_skills()));
              },
              child: Icon(Icons.add_comment),
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

            // Professional Certification
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

                      // Skills Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Skills Title:",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Edit_skills()));
                            },
                            child: Icon(Icons.edit_note_sharp),
                          )

                        ],
                      ),
                      SizedBox(height: 15,),

                      //certification Title
                      // Text(
                      //   "Certification Title:",
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                      // SizedBox(height: 5,),
                      Text(
                        skillsTitle,
                        softWrap: true,
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      SizedBox(height: 15,),

                      //  Skills You Learned From
                      Text(
                        "Skills You Learned From",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        learnedFrom,
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

                      //  Skills Description
                      Text(
                        "Skills Description",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        skilsDescription,
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

                      //  Extra Curricular Activities
                      Text(
                        "Extra Curricular Activities (Skills Related)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        extraCurricularAct,
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
        ),
      ),
    );
  }
}
