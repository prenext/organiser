import 'package:Organiser/widgets/form_items/buttons.dart';
import 'package:flutter/material.dart';

class AddTagDialog {
  static List<Tag> selectedTags = [];

  static Future<List<Tag>?> show(BuildContext context) async {
    //TextEditingController tagController = TextEditingController();

    return showDialog<List<Tag>>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Add Tag',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8.0,
                  children: AddTagDialog.selectedTags.map((tag) {
                    return Chip(
                      label: Text(tag.tag),
                    );
                  }).toList(),
                ),
                AutocompleteBasicTagExample(),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StyledButtons.secondaryOutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icons.cancel_outlined,
                      context: context,
                      text: 'Cancel',
                    ),
                    Text('|'),
                    StyledButtons.primaryElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(selectedTags);
                      },
                      text: 'Done',
                      icon: Icons.check,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

@immutable
class Tag {
  const Tag({
    required this.tag,
  });

  final String tag;

  @override
  String toString() {
    return '$tag';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Tag && other.tag == Tag;
  }

  @override
  int get hashCode => tag.hashCode;
}

class AutocompleteBasicTagExample extends StatelessWidget {
  const AutocompleteBasicTagExample({Key? key});

  static const List<Tag> _TagOptions = <Tag>[
    Tag(tag: "coding"),
    Tag(tag: "Birthday"),
    Tag(tag: "Anniversary"),
    Tag(tag: "Graduation"),
    Tag(tag: "Corporate"),
    Tag(tag: "Concert"),
    Tag(tag: "Sports Event"),
    Tag(tag: "Conference"),
    Tag(tag: "Exhibition"),
    Tag(tag: "Party"),
  ];

  static String _displayStringForOption(Tag option) => option.tag;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<Tag>(
      // Pass the necessary parameters.
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Tag>.empty();
        }
        return _TagOptions.where((Tag option) {
          return option
              .toString()
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (Tag selection) {
        if (!AddTagDialog.selectedTags.contains(selection)) {
          AddTagDialog.selectedTags.add(selection);
        }
      },
      fieldViewBuilder: (BuildContext context, tagController,
          FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextField(
          controller: tagController,
          focusNode: focusNode,
          onSubmitted: (_) {
            onFieldSubmitted();
          },
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Tag> onSelected, Iterable<Tag> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(maxHeight: 150, maxWidth: 310),
              child: ListView(
                children: options.map((Tag option) {
                  return InkWell(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(_displayStringForOption(option)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
