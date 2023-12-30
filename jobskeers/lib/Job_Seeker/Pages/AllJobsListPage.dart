import 'package:flutter/material.dart';

import '../Widgets/CoustomAppBar.dart';
import '../Widgets/Job_list_ForJOBS_page.dart';

class AllJobslistPage extends StatefulWidget {
  const AllJobslistPage({super.key});

  @override
  State<AllJobslistPage> createState() => _AllJobslistPageState();
}

class _AllJobslistPageState extends State<AllJobslistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Center(child: Text("JOBS")),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for(int i=0; i<100;i++)
            JobListForJobsPage(),

          ],
        ),
      ),
    );
  }
}
