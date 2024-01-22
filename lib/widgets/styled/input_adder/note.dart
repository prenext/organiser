import 'package:Organiser/widgets/shared/input/description.dart';
import 'package:Organiser/widgets/shared/input/buttons.dart';
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
