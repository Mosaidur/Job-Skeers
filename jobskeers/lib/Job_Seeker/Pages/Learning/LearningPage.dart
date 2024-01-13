import 'package:flutter/material.dart';

import 'Widgets/upComingCourses.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    UpComingCourse(),
    Container(child: Text("Container 2")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leadingWidth: 0,automaticallyImplyLeading: false,title: Center(child: Text("Learning"))),
      body: Column(
        children: [
          Container(
            // color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(0, 'Upcoming Courses'),
                buildNavItem(1, 'On Going Courses'),
              ],
            ),
          ),
          Expanded(
            child: pages[selectedIndex],
          ),
        ],
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
