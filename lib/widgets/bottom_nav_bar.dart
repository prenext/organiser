/* ******************************************
                 *** START***
****************************************** */

import 'package:flutter/material.dart';

class LDrawer extends StatelessWidget {
  const LDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: const Text('Navigation Drawer')),
        body: const Center(child: Text('My Page!')),

      ),
    );
  }
}

/* ******************************************
*********************************************
*********************************************
              *** END***
*********************************************
*********************************************
****************************************** */
