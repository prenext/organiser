import 'package:Organiser/models/common/event_model.dart';
import 'package:Organiser/models/enums/event_enums.dart';
import 'package:Organiser/views/widgets/styled/input_adder/repeat.dart';
import 'package:Organiser/views/widgets/styled/input_adder/timezone.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/views/widgets/styled/input_adder/title.dart';
import 'package:Organiser/views/widgets/styled/input_adder/note.dart';
import 'package:Organiser/views/widgets/styled/input_adder/cartegory.dart';
import 'package:Organiser/views/widgets/styled/input_adder/tag.dart';
import 'package:Organiser/views/widgets/styled/input_adder/image.dart';
import 'package:Organiser/views/widgets/styled/input_adder/date_duration.dart';
import 'package:Organiser/views/widgets/styled/input_adder/location.dart';
import 'package:Organiser/views/widgets/styled/input_adder/ticket.dart';
import 'package:Organiser/views/widgets/styled/input_adder/optionsAppBar.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _cartegoryController = TextEditingController();
  final List<String> _tagsController = [];
  final String _photoUrlController = '';
  final List<Map<DateTime, Map<TimeOfDay, TimeOfDay>>> _dateAndTimeController =
      [];
  final bool _isRepetingController = true;
  final Map<RepeatFrequency, List> _repetitionController = {};
  final Map<String, String> _locationController = {};
  final TextEditingController _ticketsController = TextEditingController();
  final TextEditingController _ticketCostController = TextEditingController();
  final TextEditingController _timezoneConroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  TitleAdder(
                      titleController: _titleController,
                      priorityController: _priorityController),
                  SizedBox(height: 16.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        NotesAdder(
                          notesController: _notesController,
                        ),
                        CartegoryAdder(
                          cartegoryController: _cartegoryController,
                        ),
                        TagsAdder(
                          selectedTags: _tagsController,
                        ),
                        ImageAdder(
                          imageUrlController: _photoUrlController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  DateAndTimeAdder(
                    dateAndTimeController: _dateAndTimeController,
                  ),
                  SizedBox(height: 16.0),
                  RepeatAdderWidget(
                    repeatOnController: _isRepetingController,
                    repeatController: _repetitionController,
                  ),
                  SizedBox(height: 16.0),
                  LocationAdder(
                    locationController: _locationController,
                  ),
                  SizedBox(height: 16.0),
                  TicketsAdder(
                    ticketsController: _ticketsController,
                    costPerTicketController: _ticketCostController,
                  ),
                  SizedBox(height: 16.0
                  ),
                  TimezoneAdder(
                    timezoneConroller: _timezoneConroller,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: OptionsAppBar(
        cancelTitle: 'CANCEL',
        formKey: _formKey,
        AcceptTitle: 'SAVE',
        onCancelClicked: () {
          createDraft();
        },
        onAcceptClicked: () {
          createEvent();
        },
      ),
    );
  }

  void createEvent() {
    // ignore: unused_local_variable
    Event newEvent = Event(
        title: _titleController.text,
        priority: _priorityController.text,
        notes: _notesController.text,
        category: _cartegoryController.text,
        tags: _tagsController,
        photoURL: _photoUrlController,
        dateAndTime: _dateAndTimeController,
        isRepeating: _isRepetingController,
        repetition: [_repetitionController],
        location: [_locationController],
        ticketCost: _ticketCostController.text as double,
        numberOfTickets: _ticketsController.text as int,
        timezone: _timezoneConroller.text,
        id: '');
    Navigator.pop(context);
  }

  void createDraft() {
    Navigator.pop(context);
  }
}
