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
        _buildBottomNavItem(Icons.people_rounded, 'social', context),
        _buildBottomNavItem(Icons.schedule, 'Schedules', context),
        _buildBottomNavItem(Icons.restaurant_menu_outlined, 'Food', context),
      ],
      type:  BottomNavigationBarType.fixed,
    );
  }
}
