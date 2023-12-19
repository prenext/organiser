import 'package:Organiser/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(36, 243, 33, 243),
              Color.fromARGB(0, 175, 112, 76),
            ], // Customize the gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Small image above 'Organiser' text
              Image.asset(
                'assets/icon/logo.png', // Replace with your image asset
                width: 100,
                height: 100,
              ),
              Text(
                'Organizer',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.purple,
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
