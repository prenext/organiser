import 'package:Organiser/firebase_options.dart';
import 'package:Organiser/providers/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'widgets/common/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable Firestore offline persistence
  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp( 
      theme: Provider.of<ThemeProvider>(context).themeData,  
      home: SplashScreen(
        onSelectThemeColor: () {},
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
