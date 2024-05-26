import 'package:Organiser/views/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';

class Socials extends StatefulWidget {
  const Socials({Key? key});

  @override
  State<Socials> createState() => _SocialsState();
}

class _SocialsState extends State<Socials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: 0,
        leading: Text(""),
        centerTitle: false,
        title: Text("Colaborate"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: Center(child: Text("WORK WITH OTHERS")),
    );
  }
}
