import 'package:Organiser/views/widgets/common/tabs_appbar.dart';
import 'package:flutter/material.dart';

class Food extends StatefulWidget  {
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
        appBar: TabsAppBar(tabs: [
          Tab(child: Text("meals"),),
          Tab(
            child: Text("market Place"),
          )

        ]),
        body: TabBarView(
          children: [
            _buildMealsPage(),
            _buildMarketplacePage(),
          ],
        ),
      ),
    );
  }

  Widget _buildMealsPage() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Meal 1'),
                subtitle: Text('Description for Meal 1'),
                // Customize the card as needed for your meal representation
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Meal 2'),
                subtitle: Text('Description for Meal 2'),
                // Customize the card as needed for your meal representation
              ),
            ),
            // Add more cards for other meals
          ],
        ),
      ),
    );
  }

  Widget _buildMarketplacePage() {
    List<String> restaurants = [
      'Restaurant A',
      'Restaurant B',
      'Restaurant C',
      // Add more restaurants as needed
    ];

    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(restaurants[index]),
          // Customize the ListTile as needed for your restaurant representation
        );
      },
    );
  }
}
