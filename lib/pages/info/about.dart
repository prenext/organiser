import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<bool> _isCardExpanded = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Organizer"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(
                "Task and Schedule Organization",
                "Allow users to create, edit, and delete tasks.\nProvide a calendar for scheduling and visualizing tasks.",
                0,
                Icons.lock_clock),
            _buildCard(
                "Goal and Meal Tracking",
                "Enable users to set and track personal goals.\nAllow users to log and monitor their meals.",
                1,
                Icons.star_border_outlined),
            _buildCard(
                "Progress Analysis",
                "Display progress through interactive dashboards, graphs, and charts.",
                2,
                Icons.auto_graph),
            _buildCard(
                "Data Storage",
                "Store user details, tasks, goals, and meal information securely.",
                3,
                Icons.storage_rounded),
            _buildCard(
                "Authentication",
                "Implement a secure authentication system to protect user data.",
                4,
                Icons.lock),
            _buildCard(
                "API Integrations",
                "Enable integration with maps, calendars, and social apps.",
                5,
                Icons.link_rounded),
            _buildCard(
                "Data Science Models",
                "Implement data science models for personalization and intelligent suggestions.",
                6,
                Icons.pedal_bike),
            _buildCard(
                "Notifications",
                "Provide notification capabilities to alert users about upcoming tasks or events.",
                7,
                Icons.notifications),
            _buildCard(
                "Task Completion",
                "Allow users to mark tasks as done for better tracking.",
                8,
                Icons.check_box),
            _buildCard(
                "Theme Preferences",
                "Enable users to customize the app's theme according to their preferences.",
                9,
                Icons.color_lens_sharp),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    String title,
    String subtitle,
    int index,
    IconData icon,
  ) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ExpansionTile(
            childrenPadding: EdgeInsets.all(0),
            onExpansionChanged: (isExpanded) {
              setState(() {
                _isCardExpanded[index] = isExpanded;
              });
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 25,
                ),
                SizedBox(width: 8.0),
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  )),
            ]));
  }
}
