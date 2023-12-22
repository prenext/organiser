import 'package:Organiser/pages/landing_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required Null Function() onSelectThemeColor});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    preloadAssets();
    _navigateToHome();
  }

  Future<void> preloadAssets() async {
    await Future.wait([
      precacheImage(AssetImage('assets/icon/logo.png'), context),
      precacheImage(AssetImage('assets/gif/loading.gif'), context)
    ]);
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LandingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).secondaryHeaderColor,
              Theme.of(context).scaffoldBackgroundColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/logo.png',
                width: 100,
                height: 100,
              ),
              Text(
                'Organizer',
                style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Get everything in order!🙌'),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 18),
                child: Image.asset('assets/gif/loading.gif'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
