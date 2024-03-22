import 'package:Organiser/views/widgets/dialogs/add_tag.dart';
import 'package:Organiser/views/widgets/input/buttons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TagsAdder extends StatelessWidget {

  List<String> selectedTags = [];

  TagsAdder({required this.selectedTags});

  @override
  Widget build(BuildContext context) {
    return StyledButtons.primaryElevatedButton(
        onPressed: () async {
          List<String>? result = await AddTagDialog.show(context);
          setState(() {
            selectedTags = result!;
          });
        },
        verticalPadding: 0,
        text: 'Tags',
        icon: Icons.bookmark_add_outlined,
        context: context);
  }
  
  void setState(Null Function() param0) {}
}
