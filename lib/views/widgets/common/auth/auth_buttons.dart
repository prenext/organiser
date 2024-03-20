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
        elevation: MaterialStateProperty.all(0),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all(
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
        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 3.0),
            borderRadius: BorderRadius.circular(60.0),
          ),
        ),
      ),
    );
  }
}
