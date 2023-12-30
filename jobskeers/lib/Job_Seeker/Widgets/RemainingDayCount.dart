import 'package:flutter/material.dart';

class RemainingDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current date and format it
    DateTime currentDate = DateTime.now();
    String formattedDate = '${currentDate.day}/${currentDate.month}/${currentDate.year}';
    DateTime targetDate = DateTime(2024, 1, 16);
    int remainingDays = targetDate.difference(currentDate).inDays;
    return Text(
      "${remainingDays.toString()} days left",
      style: TextStyle(
        color: Colors.black,
        // color: Color(0xff03438C),
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}
