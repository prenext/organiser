import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  BottomNavigationBarItem _buildBottomNavItem(
    IconData iconData,
    String label,
    BuildContext context,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        size: 35
        ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 50,
      items: [
        _buildBottomNavItem(Icons.dashboard_sharp, 'Home', context),
        _buildBottomNavItem(Icons.calendar_month, 'Schedules', context),
        _buildBottomNavItem(Icons.check_circle, 'Tasks', context),
        _buildBottomNavItem(Icons.chat_sharp, 'Goals', context),
        _buildBottomNavItem(Icons.restaurant, 'Meals', context),
      ],
      backgroundColor: Color.fromARGB(255, 177, 80, 201),
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
    );
  }
}
