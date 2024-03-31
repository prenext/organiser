import 'package:Organiser/views/widgets/common/custom_dialog.dart';
import 'package:flutter/material.dart';

class AddTagDialog {
  static TextEditingController tagController = TextEditingController();
  static List<String> tags = [];

  static Future<List<String>?> show(BuildContext context) async {
    return showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        return _buildDialog(context);
      },
    );
  }

  static Widget _buildDialog(BuildContext context) {
    return CustomDialog(
      button1Text: 'Cancel',
      button2Text: 'Done',
      onButton1Pressed: () {
        Navigator.pop(context);
      },
      onButton2Pressed: () {
        Navigator.pop(context, tags);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Tags',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              for (var tag in tags)
                _buildTagChip(tag, () {
                  tags.remove(tag);
                }),
            ],
          ),
          SizedBox(height: 10),
          TextField(
            controller: tagController,
            style: TextStyle(fontSize: 16),
            autocorrect: true,
            onChanged: (value) {
              if (value.endsWith(' ')) {
                final tag = value.trim();
                if (tag.isNotEmpty) {
                  tags.add(tag);
                  tagController.clear();
                }
              }
            },
            decoration: InputDecoration(
              hintText: 'Add tag',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildTagChip(String tag, VoidCallback onCancel) {
    return InputChip(
      label: Text(tag),
      onDeleted: onCancel,
      padding: EdgeInsets.only(left: 2, right: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.blue, width: 1.5),
      ),
      deleteIcon: Icon(Icons.cancel),
      deleteButtonTooltipMessage: 'Remove $tag',
    );
  }
}
