import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  final VoidCallback onGoogleSignInPressed;
  final VoidCallback onIOSSignInPressed;
  final VoidCallback onMicrosoftSignInPressed;

  SocialSignIn({
    required this.onGoogleSignInPressed,
    required this.onIOSSignInPressed,
    required this.onMicrosoftSignInPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: onGoogleSignInPressed,
          icon: Image.asset('assets/icon/google_signin.png'),
          iconSize: 40,
        ),
        IconButton(
          onPressed: onIOSSignInPressed,
          icon: Image.asset('assets/icon/ios_signin.png'),
          iconSize: 40,
        ),
        IconButton(
          onPressed: onMicrosoftSignInPressed,
          icon: Image.asset('assets/icon/microsoft.png'),
          iconSize: 40,
        ),
      ],
    );
  }
}
