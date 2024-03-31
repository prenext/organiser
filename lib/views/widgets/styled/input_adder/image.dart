import 'package:Organiser/views/widgets/input/buttons.dart';
import 'package:Organiser/views/widgets/input/file_picker.dart';
import 'package:flutter/material.dart';

class ImageAdder extends StatelessWidget {
  final String imageUrlController;

  ImageAdder({required this.imageUrlController});

  @override
  Widget build(BuildContext context) {
    return StyledButtons.primaryElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FilePickerPage()));
      },
      text: 'Image',
      icon: Icons.edit_document,
      context: context,
      verticalPadding: 0,
    );
  }
}
