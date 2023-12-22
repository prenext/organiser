import 'package:Organiser/pages/home/screens/socials.dart';
import 'package:Organiser/pages/home/screens/food.dart';
import 'package:Organiser/pages/home/screens/schedules.dart';
import 'package:Organiser/pages/home/screens/tasks.dart';
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
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Dashboard(), 
    Schedules(), 
    Tasks(),
    Socials(),
    Food(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: _screens[_currentIndex],
      floatingActionButton: CustomFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: CustomBottomAppBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
