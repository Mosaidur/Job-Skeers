import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
      BuildContext context, {
        required String message,
        required Color backgroundColor,
        required String actionLabel,
        required VoidCallback onActionPressed,
        IconData? iconData,
      }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          if (iconData != null)
            Icon(
              iconData,
              color: Colors.white,
            ),
          SizedBox(width: iconData != null ? 8.0 : 0), // Adjust spacing if an icon is present
          Expanded(
            child: Text(
              message,
            softWrap: true,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      action: SnackBarAction(
        label: actionLabel,
        textColor: Colors.white,
        onPressed: onActionPressed,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
