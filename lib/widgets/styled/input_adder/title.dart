import 'package:Organiser/widgets/shared/input/textfields.dart';
import 'package:flutter/material.dart';

class TitleAdder extends StatelessWidget {
  final TextEditingController titleController;

  TitleAdder({required this.titleController});

  @override
  Widget build(BuildContext context) {
    return StyledTextField(
      controller: titleController,
      label: 'Title',
      textSize: 25,
      trailingIcon: Icons.sports_kabaddi_rounded,
    );
  }
}
