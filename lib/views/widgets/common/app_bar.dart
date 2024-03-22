import 'package:Organiser/views/pages/messages/messages.dart';
import 'package:Organiser/views/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // Get user data from the provider
    final user = Provider.of<UserProvider>(context).user;

    // Get current time
    final currentTime = DateTime.now();

    // Determine greeting based on current time
    String greeting;
    if (currentTime.hour < 12) {
      greeting = 'Good morning';
    } else if (currentTime.hour < 18) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }

    return AppBar(
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
            // Use the user's image URL from the provider
            // If the user is not null and has an image URL, use it, otherwise use a default image
            backgroundImage: user != null && user.profilePhotoUrl != null
                ? NetworkImage(user.profilePhotoUrl ?? '')
                : null,
            child: user != null && user.profilePhotoUrl == null
                ? Icon(Icons.person)
                : null,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$greeting, ${user != null ? user.fname : "Guest"}'),
        ],
      ),
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
