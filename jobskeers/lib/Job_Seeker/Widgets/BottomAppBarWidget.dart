import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/JobSeekerHomePage.dart';
import 'package:jobskeers/Job_Seeker/Pages/ComingSoon.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Learning',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          label: 'More',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'My Job',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xff03438C),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });

        // // Handle navigation here based on the tapped index
        // switch (index) {
        //   case 0:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => JobSeekerHompage()),
        //     );
        //     break;
        //   case 1:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => ComingSoon()),
        //     );
        //     break;
        //   case 2:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => ComingSoon()),
        //     );
        //     break;
        //   case 3:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => ComingSoon()),
        //     );
        //     break;
        //   case 4:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => ComingSoon()),
        //     );
        //     break;
        // // Handle other cases as needed
        // }
      },
    );
  }
}
