import 'package:Organiser/models/sub_collections/event_model.dart';
import 'package:Organiser/pages/add_items/add_description.dart';
import 'package:Organiser/widgets/container/add_cartegory.dart';
import 'package:Organiser/widgets/container/add_tag.dart';
import 'package:Organiser/widgets/shared/buttons.dart';
import 'package:Organiser/widgets/shared/location_card.dart';
import 'package:Organiser/widgets/shared/pickers.dart';
import 'package:Organiser/widgets/shared/textfields.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/models/sub_collections/event.dart';
import 'package:image_picker/image_picker.dart';

List<String> eventCategoryList = EventCategory.values
    .map((category) => category.toString().split('.').last)
    .toList();

List<String> repeatFrequencyList = RepeatFrequency.values
    .map((frequency) => frequency.toString().split('.').last)
    .toList();

class CreateEventPage extends StatefulWidget {
  final EventModel eventModel;

  CreateEventPage(this.eventModel);

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  PickedFile? selectedImage;
  final ImagePicker _imagePicker = ImagePicker();
  String cartegoeyDropdownValue = eventCategoryList.first;
  String frequencyDropdownValue = repeatFrequencyList.first;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  ValueNotifier<String> selectedCategory = ValueNotifier<String>('');
  ValueNotifier<String> selectedFrequency = ValueNotifier<String>('');
  bool isMultiDay = false;
  bool isRepeating = false;
  bool sameEachDay = true;
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  TextEditingController ticketsController = TextEditingController();
  TextEditingController costPerTicketController = TextEditingController();
  List<Tag> selectedTags = [];
  bool setEventTime = true;
  bool setEventTickets = true;
  String selectedChip = '';

  List<SelectableChip> selectableChips = List.generate(
    5, // Adjust the number of chips as needed
    (index) => SelectableChip(
      label: 'Date ${index + 1}',
    ),
  );

  Future<void> _selectDate(
      BuildContext context, DateTime selectedDate, bool isFromDate) async {
    DateTime? pickedDate = await DatePickerUtil.pickDate(context, selectedDate);

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        if (isFromDate) {
          fromDate = pickedDate;
        } else {
          toDate = pickedDate;
        }
      });
    }
  }

  // ignore: unused_element
  Future<void> _selectTime(
      BuildContext context, DateTime selectedDate, bool isStartTime) async {
    // Set default values
    TimeOfDay initialTime = isStartTime
        ? TimeOfDay(hour: 8, minute: 0)
        : TimeOfDay(hour: 16, minute: 0);

    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (selectedTime != null) {
      DateTime selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      setState(() {
        if (isStartTime) {
          startTime = selectedDateTime;
        } else {
          endTime = selectedDateTime;
        }
      });
    }
  }

  // ignore: unused_element
  Future<void> _pickImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = image as PickedFile?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StyledTextField(
                    controller: _titleController,
                    label: 'Title',
                    textSize: 25,
                    trailingIcon: Icons.sports_kabaddi_rounded,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StyledButtons.primaryElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              DialogRoute(
                                  context: context,
                                  builder: (context) =>
                                      DescriptionEditorPage()));
                        },
                        text: 'Notes',
                        icon: Icons.edit_document,
                        context: context,
                        verticalPadding: 0,
                      ),
                      StyledButtons.primaryElevatedButton(
                        onPressed: () async {
                          String? result =
                              await AddCategoryDialog.show(context);
                          if (result != null) {}
                        },
                        text: 'Cartegory',
                        icon: Icons.post_add_rounded,
                        context: context,
                        verticalPadding: 0,
                      ),
                      StyledButtons.primaryElevatedButton(
                          onPressed: () async {
                            List<Tag>? result =
                                await AddTagDialog.show(context);
                            setState(() {
                              selectedTags = result!;
                            });
                          },
                          verticalPadding: 0,
                          text: 'Tags',
                          icon: Icons.bookmark_add_outlined,
                          context: context),
                      StyledButtons.primaryElevatedButton(
                        onPressed: () async {
                          List<Tag>? result = await AddTagDialog.show(context);
                          setState(() {
                            selectedTags = result!;
                          });
                        },
                        text: 'Image',
                        icon: Icons.add_photo_alternate_outlined,
                        context: context,
                        verticalPadding: 0,
                      ),
                    ],
                  ),
                  if (selectedTags.isNotEmpty)
                    Wrap(
                      children:
                          selectedTags.map((tag) => _buildChip(tag)).toList(),
                      spacing: 3,
                    ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (!isMultiDay)
                                SizedBox(
                                  width: 10,
                                ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          _selectDate(context, fromDate, true),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (isMultiDay)
                                            Text(
                                              'BEGIN:',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          if (isMultiDay)
                                            SizedBox(
                                              width: 8,
                                            ),
                                          Text(
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w400),
                                              "Sat, Feb 23"),
                                        ],
                                      ),
                                    ),
                                    if (isMultiDay)
                                      SizedBox(
                                        height: 10,
                                      ),
                                    if (isMultiDay)
                                      GestureDetector(
                                        onTap: () => _selectDate(
                                            context, fromDate, true),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'ENDS:',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                "Mon, Mar 15"),
                                          ],
                                        ),
                                      ),
                                  ]),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Multiple Days'),
                              Switch(
                                value: isMultiDay,
                                onChanged: (bool newValue) => setState(() {
                                  isMultiDay = newValue;
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
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
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'All day',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w300),
                              ),
                            ],
                            isSelected: [setEventTime, !setEventTime],
                            onPressed: (index) {
                              setState(() {
                                setEventTime = index == 0 ? true : false;
                              });
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
                                  setState(() {
                                    sameEachDay = newValue;
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
                  if (setEventTime)
                    Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5),
                        child: Column(
                          children: [
                            if (!sameEachDay)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    10, // Adjust the number of chips as needed
                                    (index) => SelectableChip(
                                        label: 'Sat, Mar  ${index + 1}'),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "STARTS",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "ENDS",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${toDate.toLocal().hour.toString().padLeft(2, '0')}:${toDate.toLocal().minute.toString().padLeft(2, '0')}',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Theme.of(context).hintColor
                                        ..withOpacity(0.7),
                                    ),
                                  ),
                                  Text(
                                    '${toDate.toLocal().hour.toString().padLeft(2, '0')}:${toDate.toLocal().minute.toString().padLeft(2, '0')}',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.7),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            if (!sameEachDay)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                  Card(
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
                  ),
                  LocationCard(),
                  SizedBox(height: 26.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 25,
                        child: ToggleButtons(
                          children: [
                            Text(
                              'Tickets',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'No Ticket',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w300),
                            ),
                          ],
                          isSelected: [setEventTickets, !setEventTickets],
                          onPressed: (index) {
                            setState(() {
                              setEventTickets = index == 0 ? true : false;
                            });
                          },
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      Text("Does this event have tickets?",
                          style: TextStyle(color: Theme.of(context).hintColor)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  if (setEventTickets)
                    Row(
                      children: [
                        Expanded(
                          child: StyledTextField(
                            paddingX: 15,
                            paddingY: 5,
                                                        textSize: 16,

                            controller: TextEditingController(),
                            label: 'Number of Tickets',
                            inputType: TextInputType.numberWithOptions(),
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: StyledTextField(
                            paddingX: 15,
                            paddingY: 5,
                            textSize: 16,
                            controller: TextEditingController(),
                            label: 'Cost per Ticket',
                            trailingIcon: Icons.attach_money,
                            inputType: TextInputType.numberWithOptions(),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _createEvent();
                }
              },
              child: Row(
                children: [
                  Text(
                    'NEXT',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _createEvent();
                }
              },
              child: Row(
                children: [
                  Text(
                    'SAVE',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSaveClicked() {
    // Handle save logic here
    print('Save clicked');
    setState(() {
      selectableChips.forEach((chip) {
        if (chip.isSelected) {
          chip.showAvatar = true;
        }
      });
    });
  }

  void onResetClicked() {
    // Handle reset logic here
    print('Reset clicked');
    setState(() {
      selectableChips.forEach((chip) {
        chip.showAvatar = false;
        chip.isSelected = false;
      });
    });
  }

  Widget buildSelectableChip(String label, {double fontSize = 14}) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
            color: selectedChip == label
                ? Theme.of(context).cardColor
                : Theme.of(context).primaryColor),
      ),
      selected: selectedChip == label,
      selectedColor: Theme.of(context).primaryColor,
      onSelected: (bool selected) {
        setState(() {
          selectedChip = selected ? label : '';
        });
      },
      side: BorderSide(color: Theme.of(context).primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0),
    );
  }

  Widget _buildChip(Tag tag) {
    return Chip(
      label: Text(tag.tag),
      onDeleted: () {
        _removeTag(tag);
      },
      deleteIcon: Icon(Icons.cancel),
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

  void _removeTag(Tag tag) {
    setState(() {
      selectedTags.remove(tag);
    });
    print("Tag removed " + tag.tag);
    print("remaining tags : " + selectedTags.toString());
  }

  void _createEvent() {
    Event newEvent = Event(
      id: 'your_generated_id',
      title: _titleController.text,
      description: _descriptionController.text,
      category: 'Your Category',
      tags: ['Tag1', 'Tag2'],
      startDate: fromDate,
      endDate: toDate,
      isMultiDayEvent: true,
      startTime: TimeOfDay.fromDateTime(fromDate),
      endTime: TimeOfDay.fromDateTime(toDate),
      sameEachDay: false,
      isRepeating: false,
      repeatFrequency: 'Daily',
      timeMap: [
        {'day1': TimeOfDay.fromDateTime(fromDate)},
      ],
      location: 'Event Location',
      ticketCost: 10.0,
      numberOfTickets: 100,
      photoURL: '',
    );

    widget.eventModel.addEvent(newEvent);

    Navigator.pop(context);
  }
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
