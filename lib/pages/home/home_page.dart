import 'package:Organiser/widgets/action_button.dart';
import 'package:Organiser/widgets/app_bar.dart';
import 'package:Organiser/widgets/bottom_app_bar.dart';
import 'package:Organiser/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Dashboard(),
      floatingActionButton: CustomFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
