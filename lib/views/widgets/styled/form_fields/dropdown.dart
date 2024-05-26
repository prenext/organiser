import 'package:flutter/material.dart';

typedef CustomValueCallback<T> = Future<T?> Function(BuildContext context);

class FormDropDown<T> extends StatelessWidget {
  final String labelText;
  final T value;
  final List<T> items;
  final void Function(T?) onChanged;
  final bool required;
  final List<T> customValueOptions;
  final CustomValueCallback<T> onCustomValueSelected;

  FormDropDown({
    required this.labelText,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.customValueOptions,
    required this.onCustomValueSelected,
    this.required = false,
  });

  Future<void> _handleCustomValueSelection(BuildContext context) async {
    final T? customValue = await onCustomValueSelected(context);
    if (customValue != null) {
      onChanged(customValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        DropdownButtonFormField<T>(
          isExpanded: false,
          elevation: 1,
          icon: Icon(Icons.arrow_drop_down_circle_outlined),
          padding: EdgeInsets.all(4),
          value: value,
          focusColor: Theme.of(context).primaryColor.withOpacity(0.1),
          enableFeedback: true,
          dropdownColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.97),
          borderRadius: BorderRadius.circular(10),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          ),
          onChanged: (T? newValue) async {
            if (customValueOptions.contains(newValue)) {
              await _handleCustomValueSelection(context);
            } else {
              onChanged(newValue);
            }
          },
          validator: (value) {
            if (required && (value == null || value.toString().isEmpty)) {
              return 'Please select a $labelText';
            }
            return null;
          },
          items: items.map<DropdownMenuItem<T>>((T item) {
            final String text = item.toString().split('.').last;
            final String capitalizedText = text[0].toUpperCase() + text.substring(1);
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                capitalizedText,
                style: TextStyle(),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
