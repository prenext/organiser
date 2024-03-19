import 'package:Organiser/utils/theme/light.dart';
import 'package:Organiser/views/auth/account.dart';
import 'package:Organiser/views/info/about.dart';
import 'package:Organiser/views/info/tips.dart';
import 'package:Organiser/views/settings/settings.dart';
import 'package:Organiser/views/theme/color.dart';
import 'package:Organiser/widgets/dialogs/logout.dart';
import 'package:Organiser/widgets/dialogs/rate_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Organiser/services/theme_provider.dart';

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
        color: Theme.of(context).colorScheme.primary,
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
                        color: Theme.of(context).colorScheme.primary,
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
                              fontSize: 16.0,
                              color: Theme.of(context).hintColor,
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
                              fontSize: 16.0,
                              color:  Theme.of(context).hintColor,
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
              color: Theme.of(context).hintColor.withOpacity(0.2),
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
                              builder: (context) => AccountPage()),
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
                      title: Provider.of<ThemeProvider>(context).themeData ==
                              lightMode
                          ? 'Light Mode'
                          : 'Dark Mode',
                      icon: Provider.of<ThemeProvider>(context).themeData ==
                              lightMode
                          ? Icons.sunny
                          : Icons.dark_mode,
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme(context);
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
                      icon: Icons.info_outline_rounded,
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
              color: Theme.of(context).hintColor.withOpacity(0.2),
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 16.0, bottom: 12.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© 2023 Alidante',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      _showConfirmationDialog(context);
                    },
                    child:Icon(
                      Icons.logout,
                      size: 35,
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
    await LogoutDialog.show(context);
  }
}
