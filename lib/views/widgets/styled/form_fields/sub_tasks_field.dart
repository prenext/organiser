import 'package:Organiser/views/widgets/styled/form_fields/text_field.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/models/enums/task_enums.dart';

class SubtaskWidget extends StatefulWidget {
  final Map<String, TaskStatus>? subtasks;
  final ValueChanged<Map<String, TaskStatus>?>? onChanged;

  SubtaskWidget({this.subtasks, this.onChanged});

  @override
  _SubtaskWidgetState createState() => _SubtaskWidgetState();
}

class _SubtaskWidgetState extends State<SubtaskWidget> {
  TextEditingController _titleController = TextEditingController();
  TaskStatus _status = TaskStatus.todo;
  bool _isAddingSubtask = false;
  bool _canAddSubtask = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sub Tasks",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(_isAddingSubtask ? Icons.cancel : Icons.add),
              onPressed: () {
                setState(() {
                  _isAddingSubtask = !_isAddingSubtask;
                });
              },
            ),
          ],
        ),
        if (widget.subtasks != null && widget.subtasks!.isNotEmpty) ...[
          Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  for (var entry in widget.subtasks!.entries)
                    _buildSubtaskItem(
                      entry.key,
                      entry.value,
                    ),
                ],
              )),
        ],
        SizedBox(height: 8.0),
        if (_isAddingSubtask)
          Row(
            children: [
              Expanded(
                child: FormTextField(
                  controller: _titleController,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      _canAddSubtask = value.trim().isNotEmpty;
                    });
                  },
                  labelText: 'New Subtask',
                  suffix: _canAddSubtask
                      ? IconButton(
                          icon: Icon(Icons.check,
                              color: Theme.of(context).primaryColor),
                          onPressed: _addSubtask,
                        )
                      : null,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildSubtaskItem(String title, TaskStatus status) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  width: 0.5,
                ),
              ),
              child: DropdownButton<TaskStatus>(
                style: TextStyle(color: Theme.of(context).primaryColor),
                underline: Container( ),
                elevation: 0,
                borderRadius: BorderRadius.circular(8.0),
                value: status,
                icon: Icon(Icons.arrow_drop_down_sharp),
                onChanged: (TaskStatus? newStatus) {
                  if (newStatus != null) {
                    _updateSubtaskStatus(title, newStatus);
                  }
                },
                items: TaskStatus.values
                    .where((status) => status != TaskStatus.archived)
                    .map((TaskStatus status) {
                  return DropdownMenuItem<TaskStatus>(
                    value: status,
                    child: Text(status.toString().split('.').last),
                  );
                }).toList(),
              ),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () {
                _removeSubtask(title);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addSubtask() {
    String title = _titleController.text.trim();
    if (title.isNotEmpty) {
      widget.subtasks?[title] = _status;
      _titleController.clear();
      setState(() {
        _canAddSubtask = false;
        _isAddingSubtask = false;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(widget.subtasks);
      }
    }
  }

  void _updateSubtaskStatus(String title, TaskStatus status) {
    widget.subtasks?[title] = status;
    setState(() {});
    if (widget.onChanged != null) {
      widget.onChanged!(widget.subtasks);
    }
  }

  void _removeSubtask(String title) {
    widget.subtasks?.remove(title);
    setState(() {});
    if (widget.onChanged != null) {
      widget.onChanged!(widget.subtasks);
    }
  }
}
