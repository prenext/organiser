import 'package:flutter/material.dart';
import 'package:Organiser/views/widgets/styled/form_fields/options_appbar.dart';

class CreateSchedulePage extends StatefulWidget {
  @override
  _CreateSchedulePageState createState() => _CreateSchedulePageState();
}

class _CreateSchedulePageState extends State<CreateSchedulePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
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
          createSchedule();
        },
      ),
    );
  }

  void createSchedule() {
    // ignore: unused_local_variable

    Navigator.pop(context);
  }

  void createDraft() {
    Navigator.pop(context);
  }
}
