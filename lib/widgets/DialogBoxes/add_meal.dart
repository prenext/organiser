import 'package:flutter/material.dart';


 void showAddMealDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
          child: _AddMealDialogContent(),
        );
      },
    );
  }


class _AddMealDialogContent extends StatefulWidget {
  @override
  _AddMealDialogContentState createState() => _AddMealDialogContentState();
}

class _AddMealDialogContentState extends State<_AddMealDialogContent> {
  // Define your variables for meal details
  String mealName = '';
  String mealType = '';
  List<String> ingredients = [];
  int calories = 0;
  TimeOfDay mealTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Log New Meal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            onChanged: (value) {
              mealName = value;
            },
            decoration: InputDecoration(labelText: 'Meal Name'),
          ),
          TextField(
            onChanged: (value) {
              mealType = value;
            },
            decoration: InputDecoration(labelText: 'Meal Type'),
          ),
          TextField(
            onChanged: (value) {
              // Split ingredients by comma and store in the list
              ingredients = value.split(',').map((e) => e.trim()).toList();
            },
            decoration: InputDecoration(labelText: 'Ingredients (comma-separated)'),
          ),
          TextField(
            onChanged: (value) {
              calories = int.tryParse(value) ?? 0;
            },
            decoration: InputDecoration(labelText: 'Calories'),
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              Text('Meal Time: ${mealTime.format(context)}'),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: mealTime,
                  );
                  if (pickedTime != null && pickedTime != mealTime)
                    setState(() {
                      mealTime = pickedTime;
                    });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add logic to save the meal to the database
              // using the provided details (mealName, mealType, ingredients, calories, mealTime)
              Navigator.pop(context); // Close the dialog after logging the meal
            },
            child: Text('Log Meal'),
          ),
        ],
      ),
    );
  }
}
