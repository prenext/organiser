import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({Key? key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [Center(child: Text("Food"))],
        ),
      ),
    );
  }
}
