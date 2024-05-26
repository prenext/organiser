import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Organiser/models/enums/task_enums.dart';
import 'package:Organiser/models/classes/do_day.dart';
import 'package:Organiser/models/classes/do_time.dart';
import 'package:Organiser/models/classes/repeat_interval.dart';
import 'package:Organiser/models/classes/repeat_type.dart';
import 'package:Organiser/models/common/media_model.dart';
import 'package:Organiser/models/common/task_model.dart';
import 'package:Organiser/models/enums/time_enums.dart';
import 'package:Organiser/views/services/common/task_provider.dart';
import 'package:Organiser/views/services/user_provider.dart';
import 'package:Organiser/views/widgets/styled/form_fields/files_upload.dart';
import 'package:Organiser/views/widgets/styled/form_fields/sub_tasks_field.dart';
import 'package:Organiser/views/widgets/styled/form_fields/text_field.dart';
import 'package:Organiser/views/widgets/styled/form_fields/dropdown.dart';
import 'package:Organiser/views/widgets/styled/form_fields/options_appbar.dart';
import 'package:Organiser/views/widgets/styled/form_fields/segmented_control.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TASK MODEL PROPERTIES
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _hashtagsController = TextEditingController();
  final _attachmentController = TextEditingController();
  List<MediaType> _attachments = [];
  DoDayEnum _doDayEDoDayEnum = DoDayEnum.none;
  DoTimeEnum _doTimeEnumDoTimeEnum = DoTimeEnum.none;
  TaskPriority _priority = TaskPriority.low;
  bool _repeat = false;
  RepeatIntervalEnum _repeatInterval = RepeatIntervalEnum.daily;
  Map<String, TaskStatus>? _subtasks = {};

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    final taskProvider = TaskProvider.create(
        controllerSource: 'users', controllerUserId: userProvider.user!.id);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          children: <Widget>[
            FormTextField(
              labelText: 'Title',
              controller: _titleController,
              placeholder: 'Enter task title',
              required: true,
              suffix: Icon(Icons.title),
            ),
            SizedBox(height: 16),
            FormTextField(
              labelText: 'Description',
              controller: _descriptionController,
              placeholder: 'Enter task description',
              required: true,
              keyboardType: TextInputType.multiline,
              suffix: Icon(Icons.description),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FormDropDown<DoDayEnum>(
                    labelText: 'Do Day',
                    value: _doDayEDoDayEnum,
                    items: DoDayEnum.values,
                    onChanged: (value) {
                      setState(() {
                        _doDayEDoDayEnum = value!;
                      });
                    },
                    required: true,
                    customValueOptions: [
                      DoDayEnum.custom,
                      DoDayEnum.weekDay,
                    ],
                    onCustomValueSelected: (BuildContext context) async {
                      // Implement custom value selection logic here
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: FormDropDown<DoTimeEnum>(
                    labelText: 'Do Time',
                    value: _doTimeEnumDoTimeEnum,
                    items: DoTimeEnum.values,
                    onChanged: (value) {
                      setState(() {
                        _doTimeEnumDoTimeEnum = value!;
                      });
                    },
                    required: true,
                    customValueOptions: [
                      DoTimeEnum.custom,
                    ],
                    onCustomValueSelected: (BuildContext context) async {
                      // Implement custom value selection logic here
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      return picked as DoTimeEnum;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SegmentedControl(
              segments: {
                TaskPriority.low.index: Text('Low'),
                TaskPriority.medium.index: Text('Medium'),
                TaskPriority.high.index: Text('High'),
              },
              currentValue: _priority.index,
              onChanged: (value) {
                setState(() {
                  _priority = TaskPriority.values[value];
                });
              },
              title: 'Priority',
            ),
            SizedBox(height: 16),
            FileUploadDropZone(
              title: 'Attachments',
              controller: _attachmentController,
            ),
            SizedBox(height: 16),
            FormTextField(
              labelText: 'Hashtags',
              controller: _hashtagsController,
              placeholder: 'Enter hashtags separated by commas',
              suffix: Icon(Icons.tag),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Repeat',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
              value: _repeat,
              onChanged: (value) {
                setState(() {
                  _repeat = value;
                });
              },
            ),
            if (_repeat) ...[
              SegmentedControl(
                segments: {
                  RepeatIntervalEnum.daily.index: Text('Daily'),
                  RepeatIntervalEnum.weekly.index: Text('Weekly'),
                  RepeatIntervalEnum.monthly.index: Text('Monthly'),
                  RepeatIntervalEnum.yearly.index: Text('Yearly'),
                },
                currentValue: _repeatInterval.index,
                onChanged: (value) {
                  setState(() {
                    _repeatInterval = RepeatIntervalEnum.values[value];
                  });
                },
                title: 'Repeat Interval',
              ),
            ],
            SizedBox(height: 10),
            SubtaskWidget(
              subtasks: _subtasks,
              onChanged: (subtasks) {
                setState(() {
                  _subtasks = subtasks;
                });
              },
            ),
          ],
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
          if (_formKey.currentState!.validate()) {
            createTask(taskProvider);
          }
        },
      ),
    );
  }

  void createTask(TaskProvider taskProvider) async {
    Task task = Task(
      id: '',
      title: _titleController.text,
      description: _descriptionController.text,
      doDay: _doDayEDoDayEnum == DoDayEnum.custom
          ? DoDay(tangibleValue: DateTime.now())
          : DoDay.fromEnum(_doDayEDoDayEnum),
      doTime: _doTimeEnumDoTimeEnum == DoTimeEnum.custom
          ? DoTime(tangibleValue: TimeOfDay.now())
          : DoTime.fromEnum(_doTimeEnumDoTimeEnum),
      priority: _priority,
      hashtags: _hashtagsController.text,
      repeat: _repeat,
      repeatInterval: RepeatInterval(type: _repeatInterval, every: 1),
      repeatType: RepeatType(type: RepeatTypeEnum.infinite),
      attachments: _attachments,
      subtasks: _subtasks,
    );

    // Create the task using TaskProvider
    await taskProvider.createTask(task, context);

    // Navigate back or perform further actions
  }

  void createDraft() {
    // Create draft logic here
    Navigator.pop(context);
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          error,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
