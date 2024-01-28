import 'package:Organiser/pages/messages/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final userAccount = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
          ),
          child: CircleAvatar(
            maxRadius: 10.0,
            backgroundImage: NetworkImage('https://picsum.photos/80'),
          ),
        ),
      ),
      title: Text("Good Morning, Alidante"),
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
