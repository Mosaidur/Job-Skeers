import 'package:flutter/material.dart';

import 'Widgets/AppliedJobs.dart';
import 'Widgets/SavedJobs.dart';


class MyJobPage extends StatefulWidget {
  const MyJobPage({Key? key}) : super(key: key);

  @override
  State<MyJobPage> createState() => _MyJobPageState();
}

class _MyJobPageState extends State<MyJobPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    SavedJobs(),
    AppliedJobs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(leadingWidth: 0,automaticallyImplyLeading: false,title: Center(child: Text("My Jobs"))),
      body: Column(
        children: [
          Container(
            // color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildNavItem(0, 'Saved Jobs', Icons.bookmark_border),
                buildNavItem(1, 'Applied Jobs', Icons.done),
              ],
            ),
          ),

          SizedBox(height: 20,),

          Expanded(
            child: pages[selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(int index, String label, IconData icon) {
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
                  child: Row(
                    children: [

                      Icon( icon, color: selectedIndex == index ? Colors.white : Colors.black,),
                      SizedBox(width: 10,),
                      Text(
                        label,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: selectedIndex == index ? Colors.white : Colors.black,
                          fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.w400,
                        ),
                      ),
                    ],
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
