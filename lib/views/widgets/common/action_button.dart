import 'package:Organiser/controllers/common/event_controller.dart';
import 'package:Organiser/views/pages/forms/add_event.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatefulWidget {
  @override
  _CustomFABState createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController fabAnimation;
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    fabAnimation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fabAnimation,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isMenuOpen)
              buildMenuItem(Icons.check_circle, () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            if (isMenuOpen)
              buildMenuItem(Icons.schedule, () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            if (isMenuOpen)
              buildMenuItem(Icons.stars_rounded, () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            if (isMenuOpen)
              buildMenuItem(Icons.event, () {
                EventModel eventModel =
                    new EventModel(); // Initialize your EventModel instance
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateEventPage(eventModel)),
                );
    
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            if (isMenuOpen)
              buildMenuItem(Icons.restaurant, () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            FloatingActionButton(
              child: Icon(isMenuOpen ? Icons.close : Icons.add),
              mini: true,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              onPressed: () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
                fabAnimation.status == AnimationStatus.completed
                    ? fabAnimation.reverse()
                    : fabAnimation.forward();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildMenuItem(IconData icon, VoidCallback onPressed) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      mini: true,
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 25.0,
        color: Colors.white,
      ),
    );
  }

  @override
  void dispose() {
    fabAnimation.dispose();
    super.dispose();
  }
}
