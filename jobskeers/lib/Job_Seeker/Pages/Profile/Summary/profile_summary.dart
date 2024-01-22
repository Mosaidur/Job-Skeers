import 'package:flutter/material.dart';

import 'Add_profile_summary.dart';

class Profile_Summary extends StatefulWidget {
  const Profile_Summary({super.key});

  @override
  State<Profile_Summary> createState() => _Profile_SummaryState();
}

class _Profile_SummaryState extends State<Profile_Summary> {
  @override
  Widget build(BuildContext context) {

    final String profile_summary= " ";

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Profile Summary"),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_profile_summary() ));
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

            // Profile Summary
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

                      // Profile Summary
                      Text(
                        "Profile Summary",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15,),


                      Text(
                        profile_summary,
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
