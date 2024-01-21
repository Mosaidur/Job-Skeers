import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String message;
  final Color bgcolors;
  final Widget pageLink;

  CustomDialogBox({
    Key? key,
    required this.message,
    required this.bgcolors,
    required this.title,
    required this.pageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgcolors,
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.red.shade300,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  // Replace the following line with the widget or screen you want to navigate to
                  return pageLink;
                },
              ),
            );
          },
          child: Text('OK'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade300,
          ),
        ),
      ],
    );
  }
}
