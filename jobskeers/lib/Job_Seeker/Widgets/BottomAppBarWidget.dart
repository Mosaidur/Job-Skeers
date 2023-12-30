import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/JobSeekerHomePage.dart';
import 'package:jobskeers/Job_Seeker/Pages/ComingSoon.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => JobSeekerHompage() ));

            },
              child: Icon(Icons.home)
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon() ));
              },
              child: Icon(Icons.school)
          ),
          label: 'Learning',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon() ));
              },
              child: Icon(Icons.apps)
          ),
          label: 'More',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon() ));
              },
              child: Icon(Icons.work)
          ),
          label: 'My Job',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon() ));
              },
              child: Icon(Icons.person)
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff03438C),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
