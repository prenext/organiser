import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomAppBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: BottomAppBar(
        
        shape: CircularNotchedRectangle(),
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
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular(16), // Adjust the border radius as needed
        child: Material(
          color: isSelected
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.transparent,
          elevation: 0,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: EdgeInsets.all(3), // Adjust padding as needed
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  size: 25,
                  color:
                      isSelected ? Theme.of(context).colorScheme.primary : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
