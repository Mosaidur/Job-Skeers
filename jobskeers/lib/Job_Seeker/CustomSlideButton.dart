import 'package:flutter/material.dart';

class CustomSliderButton extends StatefulWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color buttonColor;
  final VoidCallback onToggle;

  CustomSliderButton({
    Key? key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.buttonColor,
    required this.onToggle,
  }) : super(key: key);

  @override
  _CustomSliderButtonState createState() => _CustomSliderButtonState();
}

class _CustomSliderButtonState extends State<CustomSliderButton> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isToggled = !isToggled;
          widget.onToggle();
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height / 2),
          color: isToggled ? widget.backgroundColor : widget.buttonColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Align(
            alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: widget.height - 8,
              height: widget.height - 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}