import 'package:Organiser/widgets/shared/input/description.dart';
import 'package:Organiser/widgets/shared/input/buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageAdder extends StatelessWidget {
  final ImagePicker imageController;

  ImageAdder({required this.imageController});

   // ignore: unused_element
  // Future<void> _pickImage() async {
  //   XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     setState(() {
  //       selectedImage = image as PickedFile?;
  //     });
  //   }
  // }

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
      text: 'Image',
      icon: Icons.edit_document,
      context: context,
      verticalPadding: 0,
    );
  }
}
