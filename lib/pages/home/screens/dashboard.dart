import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
              height: 200,
              width: double.infinity - 100,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Row(),
               ] 
              ),
          ),
          Row(

          ),
          Row(

          ),
          Row(

          ),
          Row(

          ),
          ],
      ),
    );
  }
}


