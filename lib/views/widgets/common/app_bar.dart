import 'package:Organiser/views/pages/auth/account.dart';
import 'package:Organiser/views/pages/messages/messages.dart';
import 'package:Organiser/views/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar> {
  late Timer _timer;

  late DateFormat _timeFormat;

  @override
  void initState() {
    super.initState();
    // Initialize the timer to update time every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });

    // Set the initial time format to 24 hours
    _timeFormat = DateFormat('HH:mm:ss');
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get user data from the provider
    final user = Provider.of<UserProvider>(context).user;
    // Get current time
    final currentTime = DateTime.now();

    // Format the time based on the selected time format
    final formattedTime = _timeFormat.format(currentTime);

    // Determine greeting based on current time
    // ignore: unused_local_variable
    String greeting;
    if (currentTime.hour < 12) {
      greeting = 'Morning';
    } else if (currentTime.hour < 18) {
      greeting = 'Afternoon';
    } else {
      greeting = 'Evening';
    }

    return AppBar(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.94),
      scrolledUnderElevation: 0.0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Container(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          height: 0.3,
        ),
      ),
      // centerTitle: true,
      // leadingWidth: 150,
      title: Row(
        children: [
          Text(
              //date today,
              DateFormat('E, d MMM').format(currentTime),
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w400)),
          Text("  "),
          Text(formattedTime,
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary)),
        ],
      ),
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 35.0,
                onPressed: () => {
                      //open drawer
                      Scaffold.of(context).openDrawer()
                    },
                icon: Icon(Icons.menu)),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('$greeting,', style: TextStyle(fontSize: 13.0)),
            //     Text(
            //       '${user != null ? user.fname : "Guest"}',
            //       style: TextStyle(
            //         color: Colors.grey,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      actions: [
        NotificationBadgeIconButton(
          icon: Icons.notifications_outlined,
          badgeCount: 5, // Set the badge count here
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountPage()),
            );
          },
          child: Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1.0,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 15.0,
              backgroundImage: user != null && user.profilePhotoUrl != null
                  ? NetworkImage(user.profilePhotoUrl ?? '')
                  : null,
              child: user != null && user.profilePhotoUrl == null
                  ? Icon(Icons.person)
                  : null,
            ),
          ),
        ),
        // PopupMenuButton to switch between time formats
        PopupMenuButton<String>(
          iconSize: 35,
          onSelected: (value) {
            setState(() {
              _timeFormat = DateFormat(value);
            });
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'HH:mm:ss',
              child: Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 8),
                  Text('24 Hours'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'h:mm:ss a',
              child: Row(
                children: [
                  Icon(Icons.lock_clock),
                  SizedBox(width: 8),
                  Text('AM/PM'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NotificationBadgeIconButton extends StatelessWidget {
  final IconData icon;
  final int badgeCount;
  final VoidCallback onPressed;

  const NotificationBadgeIconButton({
    required this.icon,
    required this.badgeCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        children: [
          Icon(icon, size: 30),
          if (badgeCount > 0) // Show badge only if badgeCount is greater than 0
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.red, // Customize badge background color
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  badgeCount.toString(),
                  style: TextStyle(
                    color: Colors.white, // Customize badge text color
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
