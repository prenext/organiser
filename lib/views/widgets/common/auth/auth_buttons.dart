import 'package:flutter/material.dart';

class AuthButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const AuthButtonPrimary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        padding: WidgetStateProperty.all(padding),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}

class AuthButtonSecondary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const AuthButtonSecondary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(padding),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 3.0),
            borderRadius: BorderRadius.circular(60.0),
          ),
        ),
      ),
    );
  }
}
