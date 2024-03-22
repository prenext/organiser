import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomAppBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomBottomAppBarItem(
            iconData: Icons.dashboard_outlined,
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          CustomBottomAppBarItem(
            iconData: Icons.check_circle_outlined,
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          CustomBottomAppBarItem(
            iconData: Icons.people_rounded,
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          CustomBottomAppBarItem(
            iconData: Icons.schedule,
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
          CustomBottomAppBarItem(
            iconData: Icons.restaurant_menu_outlined,
            isSelected: currentIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class CustomBottomAppBarItem extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomBottomAppBarItem({
    required this.iconData,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(16), // Adjust the border radius as needed
      child: Material(
        color:isSelected? Colors.blue.withOpacity(0.1) :Colors.transparent,
        elevation: 0, // Add elevation for selected item
        borderRadius: BorderRadius.circular(30), // Same as the InkWell
        child: Padding(
          padding: EdgeInsets.all(5), // Adjust padding as needed
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: 30,
                color:
                    isSelected ? Theme.of(context).colorScheme.primary : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
