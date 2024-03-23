import 'package:Organiser/views/widgets/common/tabs_appbar.dart';
import 'package:flutter/material.dart';

class Socials extends StatefulWidget {
  const Socials({Key? key});

  @override
  State<Socials> createState() => _SocialsState();
}

class _SocialsState extends State<Socials> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: TabsAppBar(
          tabs: [
            Tab(
              text: 'Groups',
            ),
            Tab(
              text: 'Communities',
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Screen1(),
            Screen2(),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20, // Replace with your actual list length
        itemBuilder: (context, index) {
          return ChatListItem(
            groupName: 'Group $index',
            iconLabels: ['Events', 'Tasks', 'Goals', 'Schedules'],
            iconNumbers: [3, 5, 7, 2], // Replace with your actual numbers
          );
        });
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15, // Replace with your actual list length
      itemBuilder: (context, index) {
        return CommunityListItem(
          communityName: 'Community $index',
          eventsCount: 8, // Replace with your actual numbers
          followersCount: 120, // Replace with your actual numbers
        );
      },
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String groupName;
  final List<String> iconLabels;
  final List<int> iconNumbers;

  const ChatListItem({
    required this.groupName,
    required this.iconLabels,
    required this.iconNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // Replace with your group image or initials logic
        child: Text(groupName[0]),
      ),
      title: Text(groupName),
      subtitle: Row(
        children: List.generate(
          iconLabels.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Icon(Icons.assignment),
                Text(iconLabels[index]),
                Text(
                  '${iconNumbers[index]}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityListItem extends StatelessWidget {
  final String communityName;
  final int eventsCount;
  final int followersCount;

  const CommunityListItem({
    required this.communityName,
    required this.eventsCount,
    required this.followersCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // Replace with your community image or initials logic
        child: Text(communityName[0]),
      ),
      title: Text(communityName),
      subtitle: Row(
        children: [
          Icon(Icons.event),
          Text('$eventsCount Events'),
          SizedBox(width: 16.0),
          Icon(Icons.people),
          Text('$followersCount Followers'),
        ],
      ),
      trailing: ElevatedButton.icon(
        onPressed: () {
          // Handle follow button click
        },
        icon: Icon(Icons.add),
        label: Text('Follow'),
      ),
    );
  }
}
