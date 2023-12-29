import 'package:flutter/material.dart';

class HomePageHadder extends StatefulWidget {
  HomePageHadder({super.key});

  @override
  State<HomePageHadder> createState() => _HomePageHadderState();
}

class _HomePageHadderState extends State<HomePageHadder> {

  String number= "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: double.maxFinite,
        // height: 250,
        color: Color(0xffcae6f1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [


                  // Image Icon
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 20.0),
                    child: Container(
                      height: 70,
                      // width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/icons/man_logo.png"),
                    ),
                  ),

                  // Search bar
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0,right: 8.0),
                    child: Container(
                      height: 20,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Search"),
                            Icon(
                              Icons.search,
                              color: Color(0xff03438C),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Notification Icon
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Stack(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                              Icons.notifications,
                            color: Color(0xff03438C),
                          ),
                        ),

                        Text(
                          "${number}",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          ),
                        )

                      ],
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.menu,
                      color: Color(0xff03438C),
                    ),
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
