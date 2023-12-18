import 'package:flutter/material.dart';
import 'package:Organiser/widgets/DialogBoxes/add_task.dart';
import 'package:Organiser/widgets/DialogBoxes/add_meal.dart';
import 'package:Organiser/widgets/DialogBoxes/create_schedule.dart';
import 'package:Organiser/widgets/DialogBoxes/set_goal.dart';
import 'package:Organiser/widgets/DialogBoxes/create_event.dart';


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
              buildMenuItem(Icons.star,  () {
                showSetGoalDialog(context);
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            if (isMenuOpen)
              buildMenuItem(Icons.check_circle, () {
                showAddTaskDialog(context);
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            if (isMenuOpen)
              buildMenuItem(Icons.event,  () {
                showCreateEventDialog(context);
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            if (isMenuOpen)
              buildMenuItem(Icons.restaurant,  () {
                showAddMealDialog(context);
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            if (isMenuOpen)
              buildMenuItem(Icons.schedule, () {
                showCreateScheduleDialog(context);
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              }),
            FloatingActionButton(
              child: Icon(isMenuOpen ? Icons.close : Icons.add),
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: FloatingActionButton(
        mini: !isMenuOpen,
        onPressed: onPressed,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30.0, 
              ),
              SizedBox(height: 4),
            ],
          ),
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
