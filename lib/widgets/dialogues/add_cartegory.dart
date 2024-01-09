import 'package:Organiser/widgets/form_items/buttons.dart';
import 'package:flutter/material.dart';

class AddCategoryDialog {
  static Future<String?> show(BuildContext context) async {
    TextEditingController categoryController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color.fromARGB(235, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Add Category',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AutocompleteBasiccategoryExample(),
                SizedBox(height: 40.0),
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
                        String category = categoryController.text.trim();
                        if (category.isNotEmpty) {
                          Navigator.of(context).pop(category);
                        }
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
class Category {
  const Category({
    required this.category,
  });

  final String category;

  @override
  String toString() {
    return '$category';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Category && other.category == category;
  }

  @override
  int get hashCode => category.hashCode;
}

class AutocompleteBasiccategoryExample extends StatelessWidget {
  const AutocompleteBasiccategoryExample({Key? key});

  static const List<Category> _categoryOptions = <Category>[
    Category(category: "Wedding"),
    Category(category: "Birthday"),
    Category(category: "Anniversary"),
    Category(category: "Graduation"),
    Category(category: "Corporate Event"),
    Category(category: "Concert"),
    Category(category: "Sports Event"),
    Category(category: "Conference"),
    Category(category: "Exhibition"),
    Category(category: "Party"),
  ];

  static String _displayStringForOption(Category option) => option.category;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<Category>(
      // Pass the necessary parameters.
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Category>.empty();
        }
        return _categoryOptions.where((Category option) {
          return option
              .toString()
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (Category selection) {
        debugPrint('You just selected ${_displayStringForOption(selection)}');
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (_) {
            onFieldSubmitted();
          },
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Category> onSelected,
          Iterable<Category> options) {
        // Return a widget to display the available options.
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(maxHeight: 150, maxWidth: 310),
              child: ListView(
                children: options.map((Category option) {
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
