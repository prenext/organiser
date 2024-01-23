import 'package:flutter/material.dart';

class OptionsAppBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String cancelTitle;
  final String AcceptTitle;
  final Function() onCancelClicked;
  final Function() onAcceptClicked;

  OptionsAppBar({
      required this.formKey,
      required this.cancelTitle,
      required this.AcceptTitle,
      required this.onCancelClicked,
      required this.onAcceptClicked});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                this.onCancelClicked();
              }
            },
            child: Row(
              children: [
                Text(
                  this.cancelTitle,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                this.onAcceptClicked();
              }
            },
            child: Row(
              children: [
                Text(
                  this.AcceptTitle,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
