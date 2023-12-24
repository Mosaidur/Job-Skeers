import 'package:flutter/material.dart';

class SelectJobSekkerAndEmplpoyer extends StatefulWidget {
  const SelectJobSekkerAndEmplpoyer({super.key});

  @override
  State<SelectJobSekkerAndEmplpoyer> createState() => _SelectJobSekkerAndEmplpoyerState();
}

class _SelectJobSekkerAndEmplpoyerState extends State<SelectJobSekkerAndEmplpoyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // Banner Photo
          Container(
            width: double.maxFinite,
            height: 400,
            color: Colors.redAccent.shade100,
          ),

          // Select Job Seeker
          Container(),
          // Select Employer
          Container(),
        ],
      ),
    );
  }
}
