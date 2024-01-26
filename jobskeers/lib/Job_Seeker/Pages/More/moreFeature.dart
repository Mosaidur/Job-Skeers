import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Pages/More/widgets/AISupport.dart';
import 'package:jobskeers/Job_Seeker/Pages/More/widgets/AboutUS.dart';
import 'package:jobskeers/Job_Seeker/Pages/More/widgets/OtherFrature.dart';
import 'package:jobskeers/Job_Seeker/Pages/More/widgets/invitation.dart';

import '../Home Page/Widgets/Hiring_category.dart';
import '../Home Page/Widgets/Main_feature.dart';

class MoreFeature extends StatefulWidget {
  const MoreFeature({super.key});

  @override
  State<MoreFeature> createState() => _MoreFeatureState();
}

class _MoreFeatureState extends State<MoreFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(leadingWidth: 0,automaticallyImplyLeading: false,title: Center(child: Text("More Feature"))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Profile Management
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: EdgeInsets.symmetric(
            //     vertical: 15,
            //     horizontal: 20,
            //   ),
            //   child: Text(
            //     "Profile Management",
            //     style: TextStyle(
            //       color: Color(0xff03438C),
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),

            //Main feature Container
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                "Main Featuers",
                style: TextStyle(
                  color: Color(0xff03438C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Mian_Feature(),
            Divider(color: Colors.grey,thickness: 1,),

            //Hiring Category
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                "Hiring Category",
                style: TextStyle(
                  color: Color(0xff03438C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            HiringCategory(),
            Divider(color: Colors.grey,thickness: 1,),

            //Invaitaion
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                "Invaitaion",
                style: TextStyle(
                  color: Color(0xff03438C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Invitation(),
            Divider(color: Colors.grey,thickness: 1,),

            //AI Support
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                "AI Support",
                style: TextStyle(
                  color: Color(0xff03438C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            AI_Support(),
            Divider(color: Colors.grey,thickness: 1,),

            //Other Features
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                "Other Features",
                style: TextStyle(
                  color: Color(0xff03438C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            OthersFeatures(),
            Divider(color: Colors.grey,thickness: 1,),

            //About Us
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                "About Us",
                style: TextStyle(
                  color: Color(0xff03438C),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            AboutUsCategory(),



          ],
        ),
      ),
    );
  }
}
