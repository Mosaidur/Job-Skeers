import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Education/academic_qualification.dart';
import '../Education/language_prof.dart';
import '../Education/professional_certification.dart';
import '../Personal Info/contact_details.dart';
import '../Personal Info/job_preferences.dart';
import '../Personal Info/personal_details.dart';

class ProfileInformatioPage extends StatelessWidget {
  const ProfileInformatioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // View Profile
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20,right: 20,bottom: 10),
          child: InkWell(
            onTap: (){},
            child: Container(
              width: double.maxFinite,
              // height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10,right: 10,bottom: 10),
                child: Center(
                  child: Text(
                    "View Job Seeker Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Account Settings
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
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

                  Text(
                    "Account Settings",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Upload Photo
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Upload Photo",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Account Settings
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.settings,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Account Settings",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),

        // Personal Information
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
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

                  Text(
                    "Personal Information",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Personal Details
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> personal_details())  );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Personal Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Contact Details
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Contact_details())  );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.insert_drive_file,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Contact Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Job Preferences
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> JobPreferences())  );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.workspaces_rounded,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Job Preferences",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),


                ],

              ),
            ),
          ),
        ),

        // Education
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
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

                  Text(
                    "Education",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Academic Qualification
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AcademicQualification())  );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.school,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Academic Qualification",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Language Proficiency
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LanguageProficiency() ));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.language,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Language Proficiency",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Professional Certification
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Professional_Certification() ));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.leaderboard,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Professional Certification",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),


                ],

              ),
            ),
          ),
        ),

        // Skills and Training
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
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

                  Text(
                    "Training and Skills",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Skills
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.laptop_chromebook_outlined,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Skills",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Training Summary
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.local_library,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Training",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),

        // Award and Co Curricular Activities
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
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

                  Text(
                    "Award and Co Curricular Activities",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Award
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.workspace_premium,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Awards",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Co Curricular Activities
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.emoji_objects_rounded,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Co Curricular Activities",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),

        // Profile summary and Experience Summary
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
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

                  Text(
                    "Summary",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Profile Summary
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.star,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Profile Summary",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Experience Summary
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.emoji_events,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Experience Summary",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),

        // References and Links
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
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

                  Text(
                    "References and Links",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //References
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.person_pin_rounded,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "References",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Links
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.link,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Links",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),

        // Employment History
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
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

                  Text(
                    "Employment History",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Employment History
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.work,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Employment History",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  //  Employment History (Retired Defence Person)
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.work_history_rounded,color: Colors.black,size: 15,),
                        SizedBox(width: 15,),
                        Text(
                          "Employment History \n(Retired Defence Person)",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),

        // CV / Resume
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
          child: Container(
            width: double.maxFinite,
            // height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20,right: 20,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "CV / Resume",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Employment History
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.upload_file_sharp,color: Colors.white,size: 25,),
                        SizedBox(width: 15,),
                        Text(
                          "Upload / Customized Resume",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),

      ],
    );
  }
}
