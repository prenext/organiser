import 'package:Organiser/models/sub_collections/event_model.dart';
import 'package:Organiser/widgets/form_items/buttons.dart';
import 'package:Organiser/widgets/form_items/dropdown.dart';
import 'package:Organiser/widgets/form_items/tag_chips.dart';
import 'package:Organiser/widgets/form_items/textfields.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/models/sub_collections/event.dart';

List<String> eventCategoryList = EventCategory.values
    .map((category) => category.toString().split('.').last)
    .toList();

class CreateEventPage extends StatefulWidget {
  final EventModel eventModel;

  CreateEventPage(this.eventModel);

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  String dropdownValue = eventCategoryList.first;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  ValueNotifier<String> selectedCategory = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new Event'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StyledTextField(
                  controller: _titleController,
                  label: 'Event title',
                ),
                SizedBox(height: 16.0),
                StyledTextField(
                  controller: _descriptionController,
                  label: 'Event Description',
                  isMarkdownEnabled: true,
                ),
                SizedBox(height: 16.0),
                StyledDropdown(
                  selectedValue: dropdownValue,
                  items: eventCategoryList,
                  onChanged: (String value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TagChips(),
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
    );
  }

  void _createEvent() {
    Event newEvent = Event(
      id: 'your_generated_id',
      title: _titleController.text,
      description: _descriptionController.text,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      category: 'Your Category',
      tags: ['Tag1', 'Tag2'],
      isRepeating: false,
      repeatFrequency: 'Daily',
      isMultiDayEvent: true,
      sameEachDay: false,
      location: 'Event Location',
      ticketCost: 10.0,
      numberOfTickets: 100,
      timeMap: [
        {'day1': TimeOfDay.now()},
      ],
      photoURL: '',
    );

    widget.eventModel.addEvent(newEvent);

    Navigator.pop(context);
  }
}
