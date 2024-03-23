import 'package:flutter/material.dart';

class TabsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Tab> tabs;
  final Widget? title;

  const TabsAppBar({super.key, required this.tabs, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
       backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
        scrolledUnderElevation: 0.0,
        title: title,
        bottom: tabs.length > 0
            ? TabBar(
                labelColor: Theme.of(context).colorScheme.primary,
                indicatorColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Theme.of(context).hintColor,
                tabs: tabs,
              )
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
