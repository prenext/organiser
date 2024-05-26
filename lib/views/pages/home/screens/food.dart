import 'package:Organiser/views/widgets/common/tabs_appbar.dart';
import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: TabsAppBar(title: "Food", actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
        ], tabs: [
          Tab(
            child: Text("Meals"),
          ),
          Tab(
            child: Text("Market Place"),
          )
        ]),
        body: TabBarView(
          children: [
            _buildMealsView(),
            _buildMarketView(),
          ],
        ),
      ),
    );
  }

  Widget _buildMealsView() {
    return Center(
      child: Text('Meals  View'),
    );
  }

  Widget _buildMarketView() {
    // You can customize this view for displaying events
    return Center(
      child: Text('Market View'),
    );
  }
}
