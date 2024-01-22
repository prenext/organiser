import 'package:flutter/material.dart';

class ThemeSelectionScreen extends StatefulWidget {
  final Function(Color) onColorSelected;

  const ThemeSelectionScreen({Key? key, required this.onColorSelected})
      : super(key: key);

  @override
  _ThemeSelectionScreenState createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        foregroundColor: Theme.of(context).primaryColor,
        title: Text("Select Theme Color"),
        elevation: 1,
         actions: [
          IconButton(
            icon: Icon(Icons.refresh), // Use any icon you prefer
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: themeColors.length,
          itemBuilder: (context, index) {
            final themeColor = themeColors[index];

            return ThemeColorCard(
              color: themeColor,
              isSelected: themeColor == selectedColor,
              onTap: () {
                setState(() {
                  selectedColor = themeColor;
                });
                widget.onColorSelected(selectedColor!);
              },
            );
          },
        ),
    );
  }
}
class ThemeColorCard extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  ThemeColorCard({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 4 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.white,
                  width: 2,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              getColorName(color),
              style: TextStyle(
                color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Utility function to get color name
String getColorName(Color color) {
  Map<Color, String> colorMap = {
    Colors.red: 'Red',
    Colors.blue: 'Blue',
    Colors.green: 'Green',
    Colors.orange: 'Orange',
    Colors.purple: 'Purple',
    Colors.pink: 'Pink',
    Colors.teal: 'Teal',
    Colors.amber: 'Amber',
    Colors.cyan: 'Cyan',
    Colors.deepPurple: 'Deep Purple',
    Colors.indigo: 'Indigo',
    Colors.lightBlue: 'Light Blue',
  };

  return colorMap[color] ?? 'Unknown';
}

// List of common theme colors
List<Color> themeColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.amber,
  Colors.cyan,
  Colors.deepPurple,
  Colors.indigo,
  Colors.lightBlue,
];

