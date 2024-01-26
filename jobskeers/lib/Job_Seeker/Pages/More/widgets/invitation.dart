import 'package:flutter/cupertino.dart';

class Invitation extends StatefulWidget {
  const Invitation({super.key});

  @override
  State<Invitation> createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
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

                //Online Interview logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/online-interview.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Interview",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //Online Test logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/online-test.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Test",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //On Board Interview logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/On Board Interview.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "On Board",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Interview",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //Shortlisted Job  logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/Shortlisted Job.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Shortlisted",
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

              ],
            ),
          ),

        ],
      ),
    );
  }
}
