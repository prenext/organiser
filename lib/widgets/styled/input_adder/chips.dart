import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectableChip extends StatefulWidget {
  final String label;
  bool isSelected = false;
  bool showAvatar = false;

  SelectableChip({required this.label});

  @override
  _SelectableChipState createState() => _SelectableChipState();
}

class _SelectableChipState extends State<SelectableChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ChoiceChip(
            backgroundColor: Colors.transparent,
            label: Text(widget.label),
            selected: widget.isSelected,
            onSelected: (selected) {
              setState(() {
                widget.isSelected = selected;
              });
            },
            selectedColor: Theme.of(context).colorScheme.secondary,
            
          ),
          if (widget.showAvatar)
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
