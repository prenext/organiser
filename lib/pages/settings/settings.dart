// settings_screen.dart

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSettingCard(
                child: Column(
              children: [
                buildSettingsItem(
                    icon: Icons.timer,
                    title: "Time Zone",
                    data: "UTC",
                    switchWidget: DropdownButton<String>(
                      value: 'UTC',
                      onChanged: (String? value) {
                        // Handle time zone dropdown change
                      },
                      items: <String>['UTC', 'GMT', 'EST', 'PST']
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                    ),
                    context: context,
                    last: true),
              ],
            )),
            buildSettingCard(
              child: Column(
                children: [
                  buildSettingsItem(
                      icon: Icons.palette,
                      title: "Theme Color",
                      data: "Blue",
                      switchWidget: ElevatedButton(
                        onPressed: () {
                          // Handle theme color button press
                        },
                        child: Text("Choose Theme Color"),
                      ),
                      context: context,
                      last: true),
                ],
              ),
            ),
            buildSettingCard(
                child: Column(
              children: [
                buildSettingsItem(
                  icon: Icons.event_available,
                  title: "Default Duration",
                  data: "30 minutes",
                  switchWidget: DropdownButton<String>(
                    value: '30 minutes',
                    onChanged: (String? value) {
                      // Handle default duration dropdown change
                    },
                    items: <String>[
                      '15 minutes',
                      '30 minutes',
                      '1 hour',
                      '2 hours'
                    ]
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                  context: context,
                ),
                buildSettingsItem(
                    icon: Icons.sync,
                    title: "Sync Frequency",
                    data: "Every hour",
                    switchWidget: DropdownButton<String>(
                      value: 'Every hour',
                      onChanged: (String? value) {
                        // Handle sync frequency dropdown change
                      },
                      items: <String>['Every hour', 'Every day', 'Every week']
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                    ),
                    context: context,
                    last: true),
              ],
            )),
            buildSettingCard(
              child: Column(
                children: [
                  buildSettingsItem(
                    icon: Icons.priority_high,
                    title: "Default Priority",
                    data: "High",
                    switchWidget: DropdownButton<String>(
                      value: 'High',
                      onChanged: (String? value) {
                        // Handle priority dropdown change
                      },
                      items: <String>['High', 'Medium', 'Low']
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                    ),
                    context: context,
                  ),
                  buildSettingsItem(
                    icon: Icons.category,
                    title: "Default Category",
                    data: "Personal",
                    last: true,
                    switchWidget: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Handle category edit button press
                      },
                    ),
                    context: context,
                  ),
                ],
              ),
            ),
            buildSettingCard(
                child: Column(
              children: [
                buildSettingsItem(
                  icon: Icons.repeat,
                  title: "Recurring Tasks",
                  data: "Enabled",
                  switchWidget: Switch(
                    value: true,
                    onChanged: (bool value) {
                      // Handle recurring tasks switch change
                    },
                  ),
                  context: context,
                ),
                buildSettingsItem(
                  icon: Icons.sort,
                  last: true,
                  title: "Sort Order",
                  data: "By Priority",
                  switchWidget: DropdownButton<String>(
                    value: 'By Priority',
                    onChanged: (String? value) {
                      // Handle sort order dropdown change
                    },
                    items: <String>[
                      'By Priority',
                      'By Due Date',
                      'By Creation Date'
                    ]
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                  context: context,
                ),
              ],
            )),
            buildSettingCard(
              child: Column(
                children: [
                  buildSettingsItem(
                    icon: Icons.vibration,
                    title: "Vibrate on Reminder",
                    data: "Enabled",
                    switchWidget: Switch(
                      value: true,
                      onChanged: (bool value) {
                        // Handle vibrate on reminder switch change
                      },
                    ),
                    context: context,
                  ),
                  buildSettingsItem(
                    icon: Icons.alarm,
                    title: "Reminders",
                    data: "Enabled",
                    switchWidget: Switch(
                      value: true,
                      onChanged: (bool value) {
                        // Handle reminders switch change
                      },
                    ),
                    context: context,
                  ),
                  buildSettingsItem(
                    icon: Icons.notifications,
                    title: "Notifications",
                    data: "Enabled",
                    last: true,
                    switchWidget: Switch(
                      value: true,
                      onChanged: (bool value) {
                        // Handle notifications switch change
                      },
                    ),
                    context: context,
                  ),
                ],
              ),
            ),
            buildSettingCard(
                child: Column(
              children: [],
            )),
          ],
        ),
      ),
    );
  }

  Widget buildSettingCard({required Widget child}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsItem(
      {required BuildContext context,
      required IconData icon,
      required String title,
      required String data,
      required Widget switchWidget,
      bool last = false}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 25,
        ),
        SizedBox(width: 20),
        Container(
          width: 350,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  switchWidget,
                ],
              ),
              if (!last)
                Divider(
                  height: 2,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
