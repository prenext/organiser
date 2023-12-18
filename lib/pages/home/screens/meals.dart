import 'package:flutter/material.dart';

class Meals extends StatefulWidget {
  const Meals({Key? key});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
