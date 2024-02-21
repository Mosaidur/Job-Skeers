import 'package:flutter/material.dart';

class CustomInputDialogBox extends StatelessWidget {
  const CustomInputDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Text'),
      content: TextFormField(
        //controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter text here',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Do something with the text
            Navigator.of(context).pop();
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
