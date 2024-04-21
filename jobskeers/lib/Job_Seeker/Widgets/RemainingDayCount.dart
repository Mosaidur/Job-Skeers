import 'package:flutter/material.dart';

class RemainingDate extends StatelessWidget {
  final DateTime date;
  const RemainingDate({Key? key, required this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Get the current date and format it
    DateTime currentDate = DateTime.now();
    String formattedDate = '${currentDate.day}/${currentDate.month}/${currentDate.year}';
    DateTime targetDate = date;
    int remainingDays = date.difference(currentDate).inDays;
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
