import 'package:Organiser/firebase_options.dart';
import 'package:Organiser/views/services/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'config/system_ui.dart';
import 'views/pages/landing_page.dart';
import 'views/services/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable Firestore offline persistence
  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: OrganiserApp(),
    ),
  );
}

class OrganiserApp extends StatefulWidget {
  const OrganiserApp({Key? key}) : super(key: key);

  @override
  State<OrganiserApp> createState() => _OrganiserAppState();
}

class _OrganiserAppState extends State<OrganiserApp> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    SystemChrome.setSystemUIOverlayStyle(
        getSystemUiOverlayStyle(themeProvider.themeData));

    return MaterialApp(
      theme: themeProvider.themeData,
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: const Duration(milliseconds: 500),
    );
  }
}
