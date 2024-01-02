import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/Job_list_ForJOBS_page.dart';
import '../../Browse Jobs/BrowseJobsListPage.dart';

class SavedJobs extends StatelessWidget {
  SavedJobs({super.key});

  List savedJobs =[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [

            (savedJobs.isEmpty) ?

                Container(
                  child: Column(
                    children: [

                      Image.asset("assets/Images2/SavedJobs.png"),

                      SizedBox(height: 20,),

                      Text(
                        "No Saved Jobs Found",
                        style: TextStyle(
                          color: Color(0xff1891D9),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20,),

                      Text(
                        "You haven't saved any job yet.",
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
