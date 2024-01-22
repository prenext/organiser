import 'package:Organiser/widgets/shared/buttons.dart';
import 'package:flutter/material.dart';

class TagChips extends StatefulWidget {
  @override
  _TagChipsState createState() => _TagChipsState();
}

class _TagChipsState extends State<TagChips> {
  List<String> tags = [];
  TextEditingController tagController = TextEditingController();
  bool isAddingTag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: tags.map((tag) => _buildChip(tag)).toList(),
        ),
        SizedBox(height: 8.0),
        isAddingTag ? _buildTagInput() : _buildAddButton(),
      ],
    );
  }

  Widget _buildChip(String tag) {
    return Chip(
      label: Text(tag),
      onDeleted: () {
        _removeTag(tag);
      },
    );
  }

 Widget _buildAddButton() {
    return Row(
      children: [
        StyledButtons.primaryElevatedButton(
          onPressed: () {
            setState(() {
              isAddingTag = true;
            });
          },
          text: 'Add tags',
          icon: Icons.add, context: context,
        ),
      ],
    );
  }



  Widget _buildTagInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: tagController,
            decoration: InputDecoration(labelText: 'Tag'),
            onSubmitted: (value) {
              _addTag(value);
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            _addTag(tagController.text);
          },
        ),
        IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              isAddingTag = false;
              tagController.clear();
            });
          },
        ),
      ],
    );
  }

  void _addTag(String tag) {
    if (tag.isNotEmpty && !tags.contains(tag)) {
      setState(() {
        tags.add(tag);
        isAddingTag = false;
        tagController.clear();
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }
}
