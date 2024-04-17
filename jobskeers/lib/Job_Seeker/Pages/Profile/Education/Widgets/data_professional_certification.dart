import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data_Professional_Certification extends StatelessWidget {
  final String certificationTitle;
  final String instituteName;
  final String location;
  final String startDate;
  final String endDate;
  final Widget editpage;
  const Data_Professional_Certification({super.key, required this.certificationTitle, required this.instituteName, required this.location, required this.startDate, required this.endDate, required this.editpage});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> editpage));
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
    );
  }
}
