import 'package:flutter/cupertino.dart';

class Mian_Feature extends StatelessWidget {
  const Mian_Feature({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height ,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  //Skill test logo and text
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/icons/Skill Test.png"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Skill Test",
                            style: TextStyle(
                              color: Color(0xff03438C),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                  //Learning & Training logo and text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/Learning & trainning.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Learning &",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Training",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Career Toolkit logo and text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/Career Toolkit.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Career",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Toolkit",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Career Counseling logo and text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/Careeer Counseling.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Career",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Counseling",
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
            )
        ],
      ),
    );
  }
}
