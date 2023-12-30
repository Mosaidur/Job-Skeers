import 'package:flutter/material.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Center(child: Text("Job Details")),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            //Cover Photo and Company Logo
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                    height: 150,
                    color: Colors.cyan,
              ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.black,
                  ),
                ),
              ]
            ),

            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.white,
              child: Column(
                children: [

                  // Company Name
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0,left: 50),
                    child: Text(
                        "Company Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
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
