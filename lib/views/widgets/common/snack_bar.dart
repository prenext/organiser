import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String type, String message) {
    Color backgroundColor;
    IconData iconData;

    switch (type) {
      case 'info':
        backgroundColor = Colors.blue;
        iconData = Icons.info_outline;
        break;
      case 'warning':
        backgroundColor = Colors.orange;
        iconData = Icons.warning;
        break;
      case 'error':
        backgroundColor = Colors.red;
        iconData = Icons.error_outline;
        break;
      case 'success':
        backgroundColor = Colors.green;
        iconData = Icons.check_circle_outline;
        break;
      default:
        backgroundColor = Colors.grey;
        iconData = Icons.info_outline;
    }

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
