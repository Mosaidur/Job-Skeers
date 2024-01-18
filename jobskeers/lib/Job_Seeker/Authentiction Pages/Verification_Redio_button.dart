import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Radio_Button extends StatefulWidget {
  String select;
  final Function(String) onSelectionChanged;

  Radio_Button({required this.select, required this.onSelectionChanged});

  @override
  _Radio_ButtonState createState() => _Radio_ButtonState();
}

class _Radio_ButtonState extends State<Radio_Button> {
  List<String> verificationMethods = ["Phone Number", "Email", "Phone & Email"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int i = 0; i < verificationMethods.length; i++)
          addRadioButton(i, verificationMethods[i]),
      ],
    );
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Color(0xff03438C),
          value: verificationMethods[btnValue],
          groupValue: widget.select,
          onChanged: (value) {
            widget.onSelectionChanged(value.toString());
          },
        ),
        Text(title),
      ],
    );
  }
}
