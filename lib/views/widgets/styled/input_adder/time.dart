// ignore_for_file: must_be_immutable
import 'package:Organiser/views/widgets/styled/input_adder/chips.dart';
import 'package:flutter/material.dart';

class TimeAdder extends StatefulWidget {
  final TimeOfDay? timeController;
  final TimeOfDay? startTimeController;
  final TimeOfDay? endTimeController;
  final bool isDuration;
  bool setTime = true;
  bool sameEachDay = true;

  final bool isMultiDay;
  final bool canBeMultiDay;

  TimeAdder({
    this.timeController,
    this.startTimeController,
    this.endTimeController,
    required this.isMultiDay,
    required this.isDuration,
    required this.canBeMultiDay,
  });

  @override
  _TimeAdder createState() => _TimeAdder();
}

class _TimeAdder extends State<TimeAdder> {
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
          padding: const EdgeInsets.only(bottom: 5.0, left: 8.0, right: 8.0),
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
                  isSelected: [widget.setTime, !widget.setTime],
                  onPressed: (index) {
                    setState(() {
                      widget.setTime = index == 0 ? true : false;
                    });
                  },
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              if (widget.isMultiDay)
                Row(
                  children: [
                    Text('Same each day'),
                    Switch(
                      value: widget.sameEachDay,
                      onChanged: (bool newValue) {
                        setState(() {
                           widget.sameEachDay = newValue;
                        });
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
        if (widget.setTime)
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
                  if (widget.sameEachDay)
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
                          '08:00',
                          style: TextStyle(
                            fontSize: 40,
                            color: Theme.of(context).hintColor
                              ..withOpacity(0.7),
                          ),
                        ),
                        Text(
                          '16:00',
                          style: TextStyle(
                            fontSize: 40,
                            color: Theme.of(context).hintColor.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  if (widget.sameEachDay)
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

  void onSaveClicked() {
    selectableChips.forEach((chip) {
      if (chip.isSelected) {
        chip.showAvatar = true;
      }
    });
  }

  void onResetClicked() {
    selectableChips.forEach((chip) {
      chip.showAvatar = false;
      chip.isSelected = false;
    });
  }
}
