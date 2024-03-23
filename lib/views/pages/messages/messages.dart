// notification_screen.dart

import 'package:Organiser/views/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: Text("Notifications"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Dismissible(
                key: Key("1"),
                child: NotificationCard(
                  icon: Icons.event,
                  title: "Task Reminder",
                  description:
                      "You have a task due today. Don't forget to complete it.",
                  image: NetworkImage("https://picsum.photos/200"),
                ),
              ),
              NotificationCard(
                title: "New Update Available",
                description:
                    "Update your app to access the latest features and improvements.",
                icon: Icons.check_circle_outlined,
              ),
              NotificationCard(
                icon: Icons.event,
                title: "Task Reminder",
                description:
                    "You have a task due today. Don't forget to complete it.",
                image: NetworkImage("https://picsum.photos/200"),
              ),
              NotificationCard(
                title: "New Update Available",
                description:
                    "Update your app to access the latest features and improvements.",
                icon: Icons.check_circle_outlined,
              ),
               NotificationCard(
                title: "New Update Available",
                description:
                    "Update your app to access the latest features and improvements.",
                icon: Icons.check_circle_outlined,
              ),
              NotificationCard(
                icon: Icons.event,
                title: "Task Reminder",
                description:
                    "You have a task due today. Don't forget to complete it.",
                image: NetworkImage("https://picsum.photos/200"),
              ),
              NotificationCard(
                title: "New Update Available",
                description:
                    "Update your app to access the latest features and improvements.",
                icon: Icons.check_circle_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData? icon;
  final ImageProvider? image;
  final String title;
  final String description;

  NotificationCard({
    this.icon,
    this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               if (image != null)
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular( 5.0), 
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        image: image!,
                        fit: BoxFit.cover, 
                      ),
                    ),
                  ),
                if (image != null)
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(description),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 25,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle elevated button press
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("Dismiss"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Handle outlined button press
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("Mark as done"),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
