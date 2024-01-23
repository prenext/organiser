import 'package:Organiser/dialogues/add_cartegory.dart';
import 'package:Organiser/widgets/shared/input/buttons.dart';
import 'package:flutter/material.dart';

class CartegoryAdder extends StatelessWidget {
  final TextEditingController cartegoryController;

  CartegoryAdder({required this.cartegoryController});

  @override
  Widget build(BuildContext context) {
    return StyledButtons.primaryElevatedButton(
      onPressed: () async {
        String? result = await AddCategoryDialog.show(context);
        if (result != null) {}
      },
      text: 'Cartegory',
      icon: Icons.post_add_rounded,
      context: context,
      verticalPadding: 0,
    );
  }
}
