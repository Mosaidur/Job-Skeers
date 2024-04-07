import 'package:flutter/material.dart';



class Data_language_prof extends StatelessWidget {

  final String language;
  final String readingLevel;
  final String writingLevel;
  final String speakingLevel;
  final Widget editpage;
  const Data_language_prof({
    super.key,
        required this.language,
        required this.readingLevel,
        required this.writingLevel,
        required this.speakingLevel,
        required this.editpage
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Language Proficiency
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
                        language,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> editpage));
                        },
                        child: Icon(Icons.edit_note_sharp),
                      )

                    ],
                  ),
                  SizedBox(height: 15,),

                  //Reading Level
                  Text(
                    "Reading Level:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    readingLevel,
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

                  //  Writing Level
                  Text(
                    "Writing Level:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    writingLevel,
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

                  //  Speaking Level
                  Text(
                    "Speaking Level:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    speakingLevel,
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
