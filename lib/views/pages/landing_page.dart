import 'package:Organiser/models/user_model.dart';
import 'package:Organiser/views/pages/auth/add_user_info.dart';
import 'package:Organiser/views/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:Organiser/views/services/user_provider.dart';
import 'home/home_page.dart';
import 'onboarding_page.dart';

class LandingPage extends StatelessWidget {
  void getUserData(User user, UserProvider userProvider) async {
    await userProvider.getUser(userId: user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageDecoration(),
          StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Still waiting for authentication state
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data != null) {
                // User is authenticated, fetch user data
                final user = snapshot.data!;
                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);
                getUserData(user, userProvider);

                return StreamBuilder<UserModel?>(
                  stream: userProvider.userStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Waiting for user data stream to emit
                      return SplashScreen();
                      // return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData && snapshot.data != null) {
                      // User data is available, navigate to HomePage
                      return HomePage();
                    } else {
                      // User data is not available yet
                      return AddAccountInfo(user: user);
                    }
                  },
                );
              } else {
                // User is not authenticated, navigate to OnboardingPage
                return OnboardingPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
