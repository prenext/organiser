import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  const Meals({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Meals Today',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MealCard('Breakfast'),
              MealCard('Lunch'),
              MealCard('Dinner'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Snacks and Fruits',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MealCard('Snacks'),
              MealCard('Fruits'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Weekly Meal Schedule',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                WeekMealCard('Monday', 'Pasta'),
                WeekMealCard('Tuesday', 'Salad'),
                WeekMealCard('Wednesday', 'Chicken'),
                WeekMealCard('Thursday', 'Pizza'),
                WeekMealCard('Friday', 'Fish'),
                WeekMealCard('Saturday', 'Burger'),
                WeekMealCard('Sunday', 'Taco'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle camera button click
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.restaurant),
              onPressed: () {
                // Handle marketplace navigation
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle shopping cart or marketplace navigation
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String mealType;

  MealCard(this.mealType);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              mealType,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Your meal for $mealType'),
          ],
        ),
      ),
    );
  }
}

class WeekMealCard extends StatelessWidget {
  final String day;
  final String meal;

  WeekMealCard(this.day, this.meal);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(day),
        subtitle: Text(meal),
      ),
    );
  }
}
