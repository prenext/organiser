import 'package:flutter/material.dart';


class Socials extends StatefulWidget {
  const Socials({Key? key});

  @override
  State<Socials> createState() => _SocialsState();
}

class _SocialsState extends State<Socials> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [Center(child: Text("Socials"))],
        ),
      ),
    );
  }
}
