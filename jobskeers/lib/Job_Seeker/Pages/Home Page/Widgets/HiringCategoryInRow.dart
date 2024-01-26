import 'package:flutter/cupertino.dart';

class HiringCategoryInRow extends StatelessWidget {
  const HiringCategoryInRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        // height: MediaQuery.of(context).size.height ,
        // height: 140 ,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //Govt. Job logo and text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/icons_2/Govt. Job.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Government",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Job",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              //Private Job logo and text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/icons_2/Private Job.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Private",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Job",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              //International Jon logo and text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/icons_2/Intenationl Job.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "International",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Job",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              //contractual job logo and text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/icons_2/Contactual Job.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Contractual",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Job",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              //Remote Job logo and text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/icons_2/Remot Job.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Remote",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Job",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              //Internship logo and text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/icons_2/Intenationl Job.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Internship",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "  ",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              //Project Based Job logo and text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/icons_2/Project based Job.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Project ",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Based Job",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10,),

              //Research & Development logo and text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/icons_2/Research & Deveplopment.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Research &",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Development",
                      style: TextStyle(
                        color: Color(0xff03438C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );;
  }
}
