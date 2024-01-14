import 'package:flutter/material.dart';

class Professional_Certification extends StatefulWidget {
  const Professional_Certification({super.key});

  @override
  State<Professional_Certification> createState() => _Professional_CertificationState();
}

class _Professional_CertificationState extends State<Professional_Certification> {
  @override
  Widget build(BuildContext context) {

    final String certificationTitle= " ";
    final String instituteName= "";
    final String location= "";
    final String startDate= "";
    final String endDate= "";

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Professional Certification"),

            InkWell(
              onTap: (){},
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

                      // language
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Certification Title:",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          InkWell(
                            onTap: (){},
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
                        certificationTitle,
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

                      //  Institute Name
                      Text(
                        "Institute Name:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        instituteName,
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

                      //  Location
                      Text(
                        "Location:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        location,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      SizedBox(height: 15,),

                      //  Start Date
                      RichText(
                        text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                          children: [
                            TextSpan(text: "Start Date: "),
                            TextSpan(
                              text: " $startDate",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ]
                      ),
                      ),

                      SizedBox(height: 15,),

                      //  End Date
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: "End Date: "),
                            TextSpan(
                              text: " $endDate",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
