// repeat_adder.dart
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RepeatAdderWidget extends StatelessWidget {
  final TextEditingController repeatController;
  final TextEditingController frequencyController;
  final TextEditingController repeatOnController;
  String selectedChip = '';

  RepeatAdderWidget({
    required this.repeatController,
    required this.frequencyController,
    required this.repeatOnController,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 0,
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showRepeatFrequencyDialog(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Every Week",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.repeat,
                                    size: 25,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildSelectableChip('S'),
                                buildSelectableChip('M'),
                                buildSelectableChip('T'),
                                buildSelectableChip('W'),
                                buildSelectableChip('T'),
                                buildSelectableChip('F'),
                                buildSelectableChip('S'),
                              ],
                            )
                          ]),
                    ),
                  );
  }

  Widget buildSelectableChip(String label, {double fontSize = 14}) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
            // color: selectedChip == label
                // ? Theme.of(context).cardColor
                // : Theme.of(context).primaryColor),
      ),
      // selected: 
      // selectedColor: Theme.of(context).primaryColor,
      // onSelected: (bool selected) {
      //   setState(() {
      //     selectedChip = selected ? label : '';
      //   });
      // },
      // side: BorderSide(color: Theme.of(context).primaryColor),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0),
      // ),
      // backgroundColor: Theme.of(context).primaryColor.withOpacity(0),
      ), selected: selectedChip == label,
    );

  }

  void _showRepeatFrequencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Theme.of(context).cardColor.withOpacity(0.90),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: IntrinsicHeight(
              child: RepeatFrequencyOptions(),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Perform the necessary actions with the selected frequency
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            )
          ],
        );
      },
    );
  }


}

class RepeatFrequencyOptions extends StatefulWidget {
  @override
  _RepeatFrequencyOptionsState createState() => _RepeatFrequencyOptionsState();
}

class _RepeatFrequencyOptionsState extends State<RepeatFrequencyOptions> {
  String selectedFrequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          title: Text("Don't Repeat Event"),
          value: "Don't Repeat",
          groupValue: selectedFrequency,
          onChanged: (value) {
            setState(() {
              selectedFrequency = value!;
            });
          },
        ),
        Divider(
          height: 1,
        ),
        RadioListTile<String>(
          title: Text('Daily'),
          value: 'Daily',
          groupValue: selectedFrequency,
          onChanged: (value) {
            setState(() {
              selectedFrequency = value!;
            });
          },
        ),
        Divider(
          height: 1,
        ),
        RadioListTile<String>(
          title: Text('Weekly'),
          value: 'Weekly',
          groupValue: selectedFrequency,
          onChanged: (value) {
            setState(() {
              selectedFrequency = value!;
            });
          },
        ),
        Divider(
          height: 1,
        ),
        RadioListTile<String>(
          title: Text('Monthly'),
          value: 'Monthly',
          groupValue: selectedFrequency,
          onChanged: (value) {
            setState(() {
              selectedFrequency = value!;
            });
          },
        ),
        Divider(
          height: 1,
        ),
        RadioListTile<String>(
          title: Text('Yearly'),
          value: 'Yearly',
          groupValue: selectedFrequency,
          onChanged: (value) {
            setState(() {
              selectedFrequency = value!;
            });
          },
        ),
      ],
    );
  }
}
