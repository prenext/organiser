import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'screens/tasks.dart';
import 'screens/meals.dart';
import 'screens/schedules.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    const Dashboard(),
    const Tasks(),
    const Schedule(),
    const Meals(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text('Organise Your Tasks'),
        foregroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle the search icon tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle the notifications icon tap
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        elevation: 100,
        unselectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Meals'),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
