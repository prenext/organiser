import 'package:flutter/material.dart';
import 'package:Organiser/views/widgets/styled/form_fields/options_appbar.dart';

class CreateMealPage extends StatefulWidget {
  @override
  _CreateMealPageState createState() => _CreateMealPageState();
}

class _CreateMealPageState extends State<CreateMealPage> {
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
          createMeal();
        },
      ),
    );
  }

  void createMeal() {
    Navigator.pop(context);
  }

  void createDraft() {
    Navigator.pop(context);
  }
}
