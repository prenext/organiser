// time_picker.dart
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimePickerWidget extends StatelessWidget {
  final TextEditingController timeController;
  final TextEditingController? startTimeController;
  final TextEditingController? endTimeController;
  final bool setEventTime;
  final bool sameEachDay;
  final bool isMultiDay;
  final Function() onResetClicked;
  final Function() onSaveClicked;

  TimePickerWidget({
    required this.timeController,
    this.startTimeController,
    this.endTimeController,
    required this.setEventTime,
    required this.sameEachDay,
    required this.isMultiDay,
    required this.onResetClicked,
    required this.onSaveClicked,
  });

  List<SelectableChip> selectableChips = List.generate(
    5, // Adjust the number of chips as needed
    (index) => SelectableChip(
      label: 'Date ${index + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 25,
                child: ToggleButtons(
                  children: [
                    Text(
                      'Time',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'All day',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                  ],
                  isSelected: [setEventTime, !setEventTime],
                  onPressed: (index) {
                    // Handle the toggle logic
                    // You might want to update the state here if you are using a StatefulWidget
                  },
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              if (isMultiDay)
                Row(
                  children: [
                    Text('Same each day'),
                    Switch(
                      value: sameEachDay,
                      onChanged: (bool newValue) {
                        // Handle the switch logic
                        // You might want to update the state here if you are using a StatefulWidget
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        if (setEventTime)
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
              child: Column(
                children: [
                  if (!sameEachDay)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          10, // Adjust the number of chips as needed
                          (index) => SelectableChip(
                            label: 'Sat, Mar  ${index + 1}',
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "STARTS",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "ENDS",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${timeController.text}',
                          style: TextStyle(
                            fontSize: 40,
                            color: Theme.of(context).hintColor
                              ..withOpacity(0.7),
                          ),
                        ),
                        Text(
                          '${timeController.text}',
                          style: TextStyle(
                            fontSize: 40,
                            color: Theme.of(context).hintColor.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  if (!sameEachDay)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: onResetClicked,
                          child: Text('RESET TIME'),
                        ),
                        TextButton(
                          onPressed: onSaveClicked,
                          child: Text("SAVE DATE'S TIME"),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  //  void onSaveClicked() {
  //   // Handle save logic here
  //   print('Save clicked');
  //   setState(() {
  //     selectableChips.forEach((chip) {
  //       if (chip.isSelected) {
  //         chip.showAvatar = true;
  //       }
  //     });
  //   });
  // }

  // void onResetClicked() {
  //   // Handle reset logic here
  //   print('Reset clicked');
  //   setState(() {
  //     selectableChips.forEach((chip) {
  //       chip.showAvatar = false;
  //       chip.isSelected = false;
  //     });
  //   });
  // }
}

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
            selectedColor: Theme.of(context).secondaryHeaderColor,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          if (widget.showAvatar)
            CircleAvatar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
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

