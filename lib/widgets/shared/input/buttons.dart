import 'package:flutter/material.dart';

class StyledButtons {
  static Widget primaryElevatedButton({
    required VoidCallback onPressed,
    required String text,
    required BuildContext context,
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
        elevation: 0,
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        foregroundColor: Theme.of(context).colorScheme.primary,
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
    double borderRadius = 55.0,
    double horizontalPadding = 0,
    double verticalPadding = 0,
  }) {
    return OutlinedButton(

      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
        shape: RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ), child: Text(text),
    );
  }
}
