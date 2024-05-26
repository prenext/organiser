import 'package:flutter/material.dart';

class SegmentedControl extends StatelessWidget {
  final Map<int, Widget> segments;
  final int currentValue;
  final ValueChanged<int>? onChanged;
  final double borderRadius;
  final double paddingVertical;
  final String title;

  SegmentedControl({
    required this.segments,
    required this.currentValue,
    this.onChanged,
    this.borderRadius = 10.0,
    this.paddingVertical = 12.0,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title, // Replace with your desired label text
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Ensure even distribution of segments
            children: segments.entries.map((entry) {
              return Expanded(
                // Ensure each segment takes equal space
                child: GestureDetector(
                  onTap: () {
                    onChanged?.call(entry.key);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: paddingVertical, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: entry.key == currentValue
                          ? Theme.of(context).primaryColor.withOpacity(0.5)
                          : Colors.transparent,
                      borderRadius: BorderRadius.horizontal(
                        left: entry.key == 0
                            ? Radius.circular(borderRadius)
                            : Radius.zero,
                        right: entry.key == segments.length - 1
                            ? Radius.circular(borderRadius)
                            : Radius.zero,
                      ),
                    ),
                    child: Center(child: entry.value),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
