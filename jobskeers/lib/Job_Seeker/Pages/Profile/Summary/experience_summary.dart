import 'package:flutter/material.dart';

import 'Add_experience_summary.dart';

class Experience_summary extends StatefulWidget {
  const Experience_summary({super.key});

  @override
  State<Experience_summary> createState() => _Experience_summaryState();
}

class _Experience_summaryState extends State<Experience_summary> {
  @override
  Widget build(BuildContext context) {

    final String experience_summary= " ";

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Experience Summary"),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_Experience_summary()));
              },
              child: Icon(Icons.add_comment),
              // child: Icon(Icons.edit_note_sharp),

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

            // Experience Summary
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

                      // Experience Summary
                      Text(
                        "Experience Summary",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15,),


                      Text(
                        experience_summary,
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
