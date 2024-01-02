import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/Job_list_ForJOBS_page.dart';
import '../../Browse Jobs/BrowseJobsListPage.dart';

class AppliedJobs extends StatelessWidget {
  AppliedJobs({super.key});

  List appliedJobs =[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        // color: Colors.blue.shade50,
        child: Column(
          children: [

            // for(int i=0 ; i<10;i++)
            (appliedJobs.isEmpty) ?

            Container(
              // height: MediaQuery.of(context).size.height/1.5,
              child: Column(
                children: [

                  Image.asset("assets/Images2/AppliedJobs.png"),

                  SizedBox(height: 20,),

                  Text(
                    "No Applied Jobs Found",
                    style: TextStyle(
                      color: Color(0xff1891D9),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20,),

                  Text(
                    "You haven't applied any job yet.",
                    style: TextStyle(
                      // color: Color(0xff1891D9),
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20,),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (c) => BrowseJobslistPage()));
                    },
                    child: Container(
                      // height: 40,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color:Color(0xff1891D9),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child:Text(
                        "Browse Jobs",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )

                ],
              ),
            )
                : JobListForJobsPage(),



          ],
        ),
      ),
    );
  }
}
