import 'package:flutter/material.dart';
import 'package:Organiser/views/pages/forms/add_event.dart';
import 'package:Organiser/views/pages/forms/add_goal.dart';
import 'package:Organiser/views/pages/forms/add_meal.dart';
import 'package:Organiser/views/pages/forms/add_schedule.dart';
import 'package:Organiser/views/pages/forms/add_task.dart';

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
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        isMenuOpen ? Icons.close : Icons.add,
        size: 35,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          isMenuOpen = !isMenuOpen;
        });
        if (isMenuOpen) {
          showModalBottomSheet(
            barrierColor: Colors.black12,
            backgroundColor:
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.97),
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            builder: (BuildContext context) {
              return Container(
                height: 335,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        width: 150,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        height: 300,
                        child: Column(
                          children: [
                            buildMenuItem(Icons.check_circle, "New Task", () {
                              Navigator.pop(context);
                              _showBottomSheet(
                                  context, "New Task", CreateTaskPage());
                            }),
                            buildMenuItem(Icons.stars_rounded, "Set a Goal",
                                () {
                              Navigator.pop(context);
                              _showBottomSheet(
                                  context, "Set a Goal", CreateGoalPage());
                            }),
                            buildMenuItem(Icons.event, "Event", () {
                              Navigator.pop(context);
                              _showBottomSheet(
                                  context, "Event", CreateEventPage());
                            }),
                            buildMenuItem(Icons.schedule, "Schedule", () {
                              Navigator.pop(context);
                              _showBottomSheet(
                                  context, "Schedule", CreateSchedulePage());
                            }),
                            buildMenuItem(Icons.restaurant, "Create Meal", () {
                              Navigator.pop(context);
                              _showBottomSheet(
                                  context, "Create Meal", CreateMealPage());
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          setState(() {
            isMenuOpen = false;
          });
        }
      },
    );
  }

  void _showBottomSheet(BuildContext context, String title, Widget page) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      barrierColor: Colors.black12,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(maxHeight: 900),
            height: MediaQuery.of(context).size.height * 0.98,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColor.withOpacity(0.2)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 0),
                  margin: EdgeInsets.all(0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        color:
                            Theme.of(context).hintColor,
                        icon: Icon(
                          Icons.close,
                          size: 20,
                          weight: 1,
                        ),
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(child: page),
              ],
            ));
      },
    );
  }

  Widget buildMenuItem(IconData icon, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Theme.of(context).primaryColor),
            SizedBox(width: 20),
            Text(label, style: TextStyle(fontSize: 20)),
          ],
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
