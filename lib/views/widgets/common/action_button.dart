import 'package:Organiser/config/themes/light.dart';
import 'package:Organiser/controllers/common/event_controller.dart';
import 'package:Organiser/views/pages/forms/add_event.dart';
import 'package:Organiser/views/pages/forms/add_task.dart';
import 'package:Organiser/views/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AnimatedBuilder(
      animation: fabAnimation,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isMenuOpen)
              buildMenuItem(Icons.check_circle, () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateTaskPage()),
                );
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }, themeProvider),
            if (isMenuOpen)
              buildMenuItem(Icons.schedule, () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }, themeProvider),
            if (isMenuOpen)
              buildMenuItem(Icons.stars_rounded, () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }, themeProvider),
            if (isMenuOpen)
              buildMenuItem(Icons.event, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateEventPage()),
                );

                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }, themeProvider),
            if (isMenuOpen)
              buildMenuItem(Icons.restaurant, () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }, themeProvider),
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: themeProvider.themeData == lightMode
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(0.8),
                      width: 2)),
              child: FloatingActionButton(
                backgroundColor: themeProvider.themeData == lightMode
                    ? Theme.of(context).primaryColor.withOpacity(0.7)
                    : Theme.of(context).primaryColor.withOpacity(0.5),
                child: Icon(
                  isMenuOpen ? Icons.close : Icons.add,
                  size: 35,
                  color: Colors.white,
                ),
                // mini: true,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  setState(() {
                    isMenuOpen = !isMenuOpen;
                  });
                  fabAnimation.status == AnimationStatus.completed
                      ? fabAnimation.reverse()
                      : fabAnimation.forward();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildMenuItem(
      IconData icon, VoidCallback onPressed, var themeProvider) {
    return Container(
      width: 47,
      height: 47,
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: themeProvider.themeData == lightMode
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.5),
              width: 0.6)),
      child: FloatingActionButton(
        backgroundColor: themeProvider.themeData == lightMode
            ? Theme.of(context).primaryColor.withOpacity(0.8)
            : Theme.of(context).primaryColor.withOpacity(0.5),
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        // mini: true,
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Colors.white,
          size: 35.0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    fabAnimation.dispose();
    super.dispose();
  }
}
