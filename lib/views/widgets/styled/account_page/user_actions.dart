import 'package:flutter/material.dart';

class UserActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.02),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTileItem(
            icon: Icons.auto_graph_rounded,
            title: 'Usage Statistics',
          ),
          ListTileItem(
            icon: Icons.live_help_sharp,
            title: 'Help Desk',
          ),
          ListTileItem(
            icon: Icons.logout,
            title: 'Logout',
          ),
          ListTileItem(
            icon: Icons.delete_forever_rounded,
            title: 'Delete Account',
          ),
        ],
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const ListTileItem({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ),
      ],
    );
  }
}
