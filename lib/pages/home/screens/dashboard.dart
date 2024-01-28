import 'package:Organiser/widgets/common/action_button.dart';
import 'package:Organiser/widgets/common/app_bar.dart';
import 'package:Organiser/widgets/common/drawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: [Center(child: Text("Dashboard"))],
          ),
        ),
      ),
      floatingActionButton: CustomFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
