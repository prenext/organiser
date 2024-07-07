import 'package:Organiser/views/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:Organiser/views/services/user_provider.dart';
import 'home/home_page.dart';
import 'onboarding_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeUserProvider();
    });
  }

  void _initializeUserProvider() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        // User is signed in, initialize user data in UserProvider
        await userProvider.getUser(userId: user.uid);
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  user != null ? HomePage() : OnboardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}
