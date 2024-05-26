import 'package:flutter/material.dart';
import 'package:Organiser/views/widgets/styled/form_fields/options_appbar.dart';

class CreateGoalPage extends StatefulWidget {
  @override
  _CreateGoalPageState createState() => _CreateGoalPageState();
}

class _CreateGoalPageState extends State<CreateGoalPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:Center(
        child: Text("create"),
      ),
      bottomNavigationBar: OptionsAppBar(
        cancelTitle: 'CANCEL',
        formKey: _formKey,
        AcceptTitle: 'SAVE',
        onCancelClicked: () {
          createDraft();
        },
        onAcceptClicked: () {
          createGoal();
        },
      ),
    );
  }

  void createGoal() {
    Navigator.pop(context);
  }

  void createDraft() {
    Navigator.pop(context);
  }
}
