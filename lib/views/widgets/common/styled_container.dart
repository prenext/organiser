import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  final Widget child;

  const StyledContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).primaryColor.withOpacity(0.03),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      child: child,
    );
  }
}