import 'package:flutter/material.dart';

class Radio_Button extends StatefulWidget {
  String select;

  Radio_Button({required this.select});

  @override
  _Radio_ButtonState createState() => _Radio_ButtonState();
}

class _Radio_ButtonState extends State<Radio_Button> {
  List<String> gender = ["Phone Number", "Email", "Phone & Email"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        addRadioButton(0, 'Phone Number'),
        addRadioButton(1, 'Email'),
        addRadioButton(2, 'Phone & Email'),
      ],
    );
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Color(0xff03438C),
          value: gender[btnValue],
          groupValue: widget.select,
          onChanged: (value) {
            setState(() {
              print(value);
              widget.select = value.toString();
            });
          },
        ),
        Text(title),
      ],
    );
  }
}
