import 'package:flutter/material.dart';

class TabsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Tab> tabs;
  final String? title;
  final List<Widget>? actions;

  const TabsAppBar({super.key, required this.tabs, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        shadowColor: Colors.transparent,
        toolbarHeight: 40,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title ?? "",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        actions: actions,
        bottom: tabs.length > 0
            ? TabBar(
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelColor: Theme.of(context).colorScheme.primary,
                indicatorColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Theme.of(context).hintColor,
                tabs: tabs,
                dividerColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                indicatorSize: TabBarIndicatorSize.tab,
              )
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
