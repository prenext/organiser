import 'package:flutter/material.dart';

class StyledButtons {
  static Widget primaryElevatedButton({
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
    double borderRadius = 35.0,
    double horizontalPadding = 16.0,
    double verticalPadding = 8.0,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  static Widget secondaryOutlinedButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
    double borderRadius = 35.0,
    double horizontalPadding = 16.0,
    double verticalPadding = 8.0,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        side: BorderSide(color: Theme.of(context).primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
