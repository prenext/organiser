import 'package:Organiser/models/sub_collections/event_model.dart';
import 'package:Organiser/pages/add_items/add_description.dart';
import 'package:Organiser/widgets/dialogues/add_cartegory.dart';
import 'package:Organiser/widgets/dialogues/add_tag.dart';
import 'package:Organiser/widgets/form_items/buttons.dart';
import 'package:Organiser/widgets/form_items/dropdown.dart';
import 'package:Organiser/widgets/form_items/location_card.dart';
import 'package:Organiser/widgets/form_items/pickers.dart';
import 'package:Organiser/widgets/form_items/textfields.dart';
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
                    trailingIcon: Icons.sports_kabaddi_rounded,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StyledButtons.primaryElevatedButton(
                        onPressed: () async {
                          String? result =
                              await AddCategoryDialog.show(context);
                          if (result != null) {}
                        },
                        text: 'Cartegory',
                        icon: Icons.add,
                      ),
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
                        icon: Icons.add,
                      ),
                      StyledButtons.primaryElevatedButton(
                        onPressed: () async {
                          List<Tag>? result = await AddTagDialog.show(context);
                          setState(() {
                            selectedTags = result!;
                          });
                        },
                        text: 'Tags',
                        icon: Icons.add,
                      ),
                      StyledButtons.primaryElevatedButton(
                        onPressed: () async {
                          List<Tag>? result = await AddTagDialog.show(context);
                          setState(() {
                            selectedTags = result!;
                          });
                        },
                        text: 'Image',
                        icon: Icons.camera,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  if (selectedTags.isNotEmpty)
                    Text(
                      'Tags',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  Wrap(
                    children:
                        selectedTags.map((tag) => _buildChip(tag)).toList(),
                    spacing: 3,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          StyledButtons.secondaryOutlinedButton(
                            onPressed: () =>
                                _selectDate(context, fromDate, true),
                            text: '${fromDate.toLocal()}'.split(' ')[0],
                            icon: Icons.calendar_month,
                            context: context,
                            borderRadius: 30,
                            verticalPadding: 10,
                            horizontalPadding: 35,
                          ),
                        ],
                      ),
                      if (isMultiDay) Icon(Icons.remove),
                      if (isMultiDay)
                        Column(
                          children: [
                            StyledButtons.secondaryOutlinedButton(
                              onPressed: () =>
                                  _selectDate(context, toDate, false),
                              text: '${toDate.toLocal()}'.split(' ')[0],
                              icon: Icons.calendar_month,
                              context: context,
                              borderRadius: 30,
                              verticalPadding: 10,
                              horizontalPadding: 35,
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Duration',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          StyledButtons.secondaryOutlinedButton(
                            onPressed: () =>
                                _selectTime(context, fromDate, true),
                            text:
                                '${fromDate.toLocal().hour.toString().padLeft(2, '0')}:${fromDate.toLocal().minute.toString().padLeft(2, '0')}',
                            icon: Icons.access_time,
                            context: context,
                            borderRadius: 10,
                            verticalPadding: 10,
                            horizontalPadding: 40,
                          ),
                        ],
                      ),
                      Icon(Icons.remove),
                      Column(
                        children: [
                          StyledButtons.secondaryOutlinedButton(
                            onPressed: () =>
                                _selectTime(context, toDate, false),
                            text:
                                '${toDate.toLocal().hour.toString().padLeft(2, '0')}:${toDate.toLocal().minute.toString().padLeft(2, '0')}',
                            icon: Icons.access_time,
                            context: context,
                            borderRadius: 10,
                            verticalPadding: 10,
                            horizontalPadding: 40,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 26.0),
                  LocationCard(),
                  SizedBox(height: 26.0),
                  Row(
                    children: [
                      Expanded(
                        child: StyledTextField(
                          controller: TextEditingController(),
                          label: 'Number of Tickets',
                          inputType: TextInputType.numberWithOptions(),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: StyledTextField(
                          controller: TextEditingController(),
                          label: 'Cost per Ticket',
                          trailingIcon: Icons.attach_money,
                          inputType: TextInputType.numberWithOptions(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Repeat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Switch(
                        value: isRepeating,
                        onChanged: (bool newValue) {
                          setState(() {
                            isRepeating = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Visibility(
                    visible: isRepeating,
                    child: Column(
                      children: [
                        StyledDropdown(
                          selectedValue: frequencyDropdownValue,
                          items: repeatFrequencyList,
                          onChanged: (String value) {
                            setState(() {
                              frequencyDropdownValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 16.0),
                        StyledDropdown(
                          selectedValue: cartegoeyDropdownValue,
                          items: eventCategoryList,
                          onChanged: (String value) {
                            setState(() {
                              cartegoeyDropdownValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  StyledButtons.primaryElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _createEvent();
                      }
                    },
                    text: 'Create Event',
                    icon: Icons.check,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
