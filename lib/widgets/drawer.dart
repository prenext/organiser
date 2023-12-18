import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Organiser',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://picsum.photos/40/80'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alidante',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          'alidante@gmail.com',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(
              Icons.settings,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add your navigation logic for Settings
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.account_box,
            ),
            title: const Text('Account'),
            onTap: () {
              Navigator.pop(context);
              // Add your navigation logic for Account
            },
          ),
          ListTile(
            title: const Text('Theme'),
            leading: const Icon(
              Icons.color_lens_outlined,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add your navigation logic for Theme
            },
          ),
          ListTile(
            title: const Text('Community'),
            leading: const Icon(
              Icons.people,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add your navigation logic for Community
            },
          ),
          ListTile(
            title: const Text('Rate us'),
            leading: const Icon(
              Icons.star,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add your navigation logic for Rate us
            },
          ),
          ListTile(
            title: const Text('Tips'),
            leading: const Icon(
              Icons.tips_and_updates,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add your navigation logic for Tips
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(
              Icons.details,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add your navigation logic for About
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            leading: const Icon(
              Icons.exit_to_app,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add your navigation logic for Log Out
            },
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            '     © 2023 Alidante',
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
