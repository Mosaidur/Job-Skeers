import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Authentiction%20Pages/JobSeekerSign_In.dart';

class SelectLoginScreen extends StatefulWidget {
  const SelectLoginScreen ({Key? key}) : super(key: key);

  @override
  _SelectLoginScreenState createState() => _SelectLoginScreenState();
}

class _SelectLoginScreenState extends State<SelectLoginScreen > {
  int selectedIndex = 0;

  final List<Widget> pages = [
    JobSeekerSigninScreen(),
    Container(child: Text("Container 2")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            child: pages[selectedIndex],
          ),



        ],
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 70,
        child: Column(
          children: [

            Container(
              // color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNavItem(0, "I'm Job Seeker"),
                  buildNavItem(1, "I'm Employer"),
                ],
              ),
            ),
            // SizedBox(height: 20,)

            // Text(
            //   "Powered by",
            //   style: TextStyle(
            //       color: Color(0xff03438C),
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset("assets/images/cdc_logo.png",height: 80,),
            //     Image.asset("assets/images/skilljobs_logo.png",height: 80,)
            //   ],
            // ),
            // Image.asset("assets/images/Daffodil-International-University-DIU-logo.png",height: 50,)
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(int index, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              // width: MediaQuery.of(context).size.width/2.2,
              decoration: BoxDecoration(
                  color: selectedIndex == index ? Color(0xff03438C) : Color(0xffcae6f1),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: selectedIndex == index ? Colors.white : Colors.black,
                      fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
