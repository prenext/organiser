import 'package:Organiser/views/home/screens/food.dart';
import 'package:Organiser/views/home/screens/schedules.dart';
import 'package:Organiser/views/home/screens/socials.dart';
import 'package:Organiser/views/home/screens/tasks.dart';
import 'package:Organiser/widgets/common/bottom_app_bar.dart';
import 'package:Organiser/widgets/common/drawer.dart';
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
    Tasks(),
    Socials(),
    Schedules(),
    Food(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      drawer: CustomDrawer(),
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
