import 'package:flutter/material.dart';

class StyledDropdown extends StatelessWidget {
  final String selectedValue;
  final List<String> items;
  final void Function(String) onChanged;

  StyledDropdown({
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) => selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
