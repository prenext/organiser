import 'package:Organiser/pages/info/screens/about.dart';
import 'package:Organiser/pages/info/screens/tips.dart';
import 'package:Organiser/pages/settings/screens/settings.dart';
import 'package:Organiser/pages/theme/screens/theme_color.dart';
import 'package:Organiser/pages/theme/screens/theme_mode.dart';
import 'package:Organiser/pages/user/screens/account.dart';
import 'package:Organiser/pages/user/screens/login.dart';
import 'package:Organiser/widgets/DialogBoxes/rate_app.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer();

  Widget _buildListTileWithDecoration({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),
      leading: Icon(
        icon,
        size: 35,
        color: Theme.of(context).primaryColor,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      dense: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://picsum.photos/200/200'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 4.0, // Adjust the width as needed
                      ),
                    ),
                  ),
                  const SizedBox(height: 36.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alidante',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'alidante@gmail.com',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Goals',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '25',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildListTileWithDecoration(
                      title: 'Account',
                      icon: Icons.account_box,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AccountPage(username: "Alidante")),
                        );
                      },
                      context: context),
                  _buildListTileWithDecoration(
                      title: 'Settings',
                      icon: Icons.settings,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                            ));
                      },
                      context: context),
                  _buildListTileWithDecoration(
                      title: 'Theme Color',
                      icon: Icons.color_lens_outlined,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThemeSelectionScreen(
                                onColorSelected: (Color) {},
                              ),
                            ));
                      },
                      context: context),
                  _buildListTileWithDecoration(
                      title: 'Light Theme',
                      icon: Icons.sunny,
                      onTap: () {
                        Navigator.push(
                            context,
                            DialogRoute(
                              context: context,
                              builder: (context) => ThemeDialog(
                                onThemeSelected: (String) {},
                              ),
                            ));
                      },
                      context: context),
                  _buildListTileWithDecoration(
                      title: 'Rate App',
                      icon: Icons.star,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            DialogRoute(
                                builder: (context) => AppRatingDialog(),
                                context: context));
                      },
                      context: context),
                  _buildListTileWithDecoration(
                      title: 'About',
                      icon: Icons.people,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutPage(),
                            ));
                      },
                      context: context),
                  _buildListTileWithDecoration(
                      title: 'Tips',
                      icon: Icons.tips_and_updates,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TipsPage(),
                            ));
                      },
                      context: context),
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 16.0, bottom: 12.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© 2023 Alidante',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                       Navigator.of(context).pop();
                      _showConfirmationDialog(context);
                    },
                    child: Row(children: <Widget>[
                      Text("Log out"),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ]),
                  )
                ],
              ),
            )),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure to Logout?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text('Logout'),
            ),
           ] )
          ],
        );
      },
    );
  }
}
