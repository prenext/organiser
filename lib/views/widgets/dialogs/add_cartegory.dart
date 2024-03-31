import 'package:Organiser/views/widgets/common/custom_dialog.dart';
import 'package:flutter/material.dart';

class AddCategoryDialog {
  static Future<String?> show(BuildContext context) async {
    TextEditingController categoryController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          button1Text: 'Cancel',
          button2Text: 'Done',
          onButton1Pressed: () {
            Navigator.pop(context);
          },
          onButton2Pressed: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                'Add Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 30),
              TextField(
                controller: categoryController,
                style: TextStyle(fontSize: 16),
                autocorrect: true,

                decoration: InputDecoration(
                  hintText: 'Category',
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
      },
    );
  }
}
