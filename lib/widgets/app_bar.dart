import 'package:Organiser/pages/messages/screens/messages.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      title: Text("Organiser"),
      centerTitle: true,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      foregroundColor: Theme.of(context).primaryColor,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
