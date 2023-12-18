import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Organiser"),
      backgroundColor: Color.fromARGB(255, 252, 244, 253),
      foregroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
