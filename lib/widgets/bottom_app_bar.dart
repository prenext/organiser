import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomAppBar({required this.currentIndex, required this.onTap});

  BottomNavigationBarItem _buildBottomNavItem(
    IconData iconData,
    String label,
    BuildContext context,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        size: 25
        ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      elevation: 20,
      items: [
        _buildBottomNavItem(Icons.dashboard_outlined, 'Home', context),
        _buildBottomNavItem(Icons.check_circle_outlined, 'Tasks', context),
        _buildBottomNavItem(Icons.badge_outlined, 'Goals', context),
        _buildBottomNavItem(Icons.schedule, 'Schedules', context),
        _buildBottomNavItem(Icons.restaurant, 'Meals', context),
      ],
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Color.fromARGB(255, 139, 139, 139),
      type:  BottomNavigationBarType.fixed,
    );
  }
}
