import 'package:Organiser/views/widgets/input/buttons.dart';
import 'package:Organiser/views/widgets/input/description.dart';
import 'package:flutter/material.dart';

class NotesAdder extends StatelessWidget {
  final TextEditingController notesController;

  NotesAdder({required this.notesController});

  @override
  Widget build(BuildContext context) {
    return StyledButtons.primaryElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            DialogRoute(
                context: context,
                builder: (context) => DescriptionEditorPage()));
      },
      text: 'Notes',
      icon: Icons.edit_document,
      context: context,
      verticalPadding: 0,
    );
  }
}
