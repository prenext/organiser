import 'dart:ui';

import 'package:Organiser/views/pages/info/about.dart';
import 'package:Organiser/views/pages/info/tips.dart';
import 'package:Organiser/views/pages/settings/settings.dart';
import 'package:Organiser/views/services/user_provider.dart';
import 'package:Organiser/views/widgets/dialogs/logout.dart';
import 'package:Organiser/views/widgets/dialogs/rate_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      elevation: 0,
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      clipBehavior: Clip.hardEdge,
      shape: Border.all(
          width: 0.5, color: Theme.of(context).primaryColor.withOpacity(0.2)),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                final user = userProvider.user;
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: NetworkImage('https://source.unsplash.com/random'),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Container(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.5),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                  width: 1.0, // Adjust the width as needed
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                maxRadius: 10.0,
                                backgroundImage: user != null &&
                                        user.profilePhotoUrl != null
                                    ? NetworkImage(user.profilePhotoUrl ?? '')
                                    : null,
                                child: user != null &&
                                        user.profilePhotoUrl == null
                                    ? Icon(Icons.person)
                                    : null,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display the user's name
                                Text(
                                  user != null ? user.username : 'Guest',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  user != null ? user.email : '',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            // Divider(
            //   height: 1,
            //   color: Theme.of(context).hintColor.withOpacity(0.2),
            // ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildListTileWithDecoration(
                      title: 'Settings',
                      icon: Icons.settings,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                            ));
                      },
                      context: context),
                  _buildListTileWithDecoration(
                      title: 'Theme',
                      icon: Icons.color_lens_outlined,
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ThemeSelectionScreen(
                        //         onColorSelected: (Color) {},
                        //       ),
                        //     ));
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
                    '© ${DateTime.now().year} Alidantech co',
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
                    child: Icon(
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
