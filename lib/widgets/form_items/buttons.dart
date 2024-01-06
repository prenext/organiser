import 'package:flutter/material.dart';

class StyledButtons {
  static Widget primaryElevatedButton({
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0), 
        ),
      ),
    );
  }

  static Widget secondaryOutlinedButton({
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.deepOrange), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0), 
        ),
      ),
    );
  }
}
