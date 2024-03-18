import 'package:Organiser/widgets/input/textfields.dart';
import 'package:flutter/material.dart';

class TitleAdder extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController priorityController;

  TitleAdder({required this.titleController, required this.priorityController});

  @override
  Widget build(BuildContext context) {
    return StyledTextField(
      controller: titleController,
      label: 'Title',
      textSize: 25,
      trailingIcon: Icons.circle,
      iconColor: Colors.green,
    );
  }
}
