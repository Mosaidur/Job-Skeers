import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Event/event_page.dart';
import '../../Groups/AllGroupPage.dart';

class OthersFeatures extends StatefulWidget {
  const OthersFeatures({super.key});

  @override
  State<OthersFeatures> createState() => _OthersFeaturesState();
}

class _OthersFeaturesState extends State<OthersFeatures> {
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

                //Online Job Fair logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/Online Job Fair.png"),
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
                        "Job Fair",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //Events logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage(backIcon: true)));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/Images2/Events.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Events",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Groups logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AllGroupPage()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/Images2/Groups.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Groups",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " ",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //chat  logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/Chat.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " ",
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
