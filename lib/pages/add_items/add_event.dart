import 'package:Organiser/models/sub_collections/event_model.dart';
import 'package:Organiser/widgets/shared/container/add_tag.dart';
import 'package:Organiser/widgets/styled/input_adder/location.dart';
import 'package:Organiser/widgets/styled/input_adder/cartegory.dart';
import 'package:Organiser/widgets/styled/input_adder/image.dart';
import 'package:Organiser/widgets/styled/input_adder/note.dart';
import 'package:Organiser/widgets/styled/input_adder/tag.dart';
import 'package:Organiser/widgets/styled/input_adder/title.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/models/sub_collections/event.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventPage extends StatefulWidget {
  final EventModel eventModel;

  CreateEventPage(this.eventModel);

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _cartegoryController = TextEditingController();
  final TextEditingController ticketsController = TextEditingController();
  final TextEditingController costPerTicketController = TextEditingController();

  List<Tag> selectedTags = [];
  final ImagePicker _imagePicker = ImagePicker();

  // ignore: unused_field
  Map<DateTime, Duration> _dateDurationControler = {};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<String> selectedFrequency = ValueNotifier<String>('');
  bool isMultiDay = false;
  bool isRepeating = false;
  bool sameEachDay = true;
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();

  

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
                  TitleInput(titleController: _titleController),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NotesAdder(
                        notesController: _notesController,
                      ),
                      CartegoryAdder(
                        cartegoryController: _cartegoryController,
                      ),
                      TagsAdder(
                        selectedTags: selectedTags,
                      ),
                      ImageAdder(
                        imageController: _imagePicker,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  LocationCard(),
                  SizedBox(height: 26.0),
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

  void _createEvent() {
    Event newEvent = Event(
      id: 'your_generated_id',
      title: _titleController.text,
      description: _notesController.text,
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
