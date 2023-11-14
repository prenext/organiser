import 'package:flutter/material.dart';
import 'widgets/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const OrganiserApp());
}

class OrganiserApp extends StatefulWidget {
  const OrganiserApp({Key? key}) : super(key: key);

  @override
  State<OrganiserApp> createState() => _OrganiserAppState();
}

class _OrganiserAppState extends State<OrganiserApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return  MaterialApp(
         theme: ThemeData(
           primarySwatch: Colors.purple,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
