import 'package:flutter/cupertino.dart';

class AI_Support extends StatefulWidget {
  const AI_Support({super.key});

  @override
  State<AI_Support> createState() => _AI_SupportState();
}

class _AI_SupportState extends State<AI_Support> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height ,
      // height: 120 ,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                //AI Jobs Recommendation logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/AI Jobs Recommendation.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "AI \nRecommended",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Jobs",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),


                //AI Company Recommendation logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/AI Company Recommendation.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "AI \nRecommended",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Company",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //AI Job Guidance logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/AI Job Guidance.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "AI Job",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Guidance",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //AI Job Alert  logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/AI Job Alert.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "AI Job",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Alert",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 12
                          ,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
