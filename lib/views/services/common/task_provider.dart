import 'package:flutter/material.dart';
import 'package:Organiser/controllers/common/task_controller.dart';
import 'package:Organiser/models/common/task_model.dart';

class TaskProvider with ChangeNotifier {
  final TaskController _taskController;
  List<Task> _tasks = [];
  bool _isLoading = false;
  String? _error;

  TaskProvider(this._taskController);

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> createTask(Task task, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _taskController.addTask(task);
      _tasks.add(task);

      _showSuccessSnackbar(context, 'Task created successfully.');
    } catch (e) {
      _error = 'Failed to create task: $e';
      _showErrorSnackbar(context, _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getTasks(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      _tasks = await _taskController.getAllTasks();
      _showSuccessSnackbar(context, 'Tasks fetched successfully.');
    } catch (e) {
      _error = 'Failed to get tasks: $e';
      _showErrorSnackbar(context, _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateTask(Task task, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _taskController.updateTask(task);
      _tasks.removeWhere((element) => element.id == task.id);
      _tasks.add(task);

      _showSuccessSnackbar(context, 'Task updated successfully.');
    } catch (e) {
      _error = 'Failed to update task: $e';
      _showErrorSnackbar(context, _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteTask(String taskId, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _taskController.deleteTask(taskId);
      _tasks.removeWhere((element) => element.id == taskId);

      _showSuccessSnackbar(context, 'Task deleted successfully.');
    } catch (e) {
      _error = 'Failed to delete task: $e';
      _showErrorSnackbar(context, _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _showSuccessSnackbar(BuildContext context, String message) {
    // Implement success message logic here if needed
  }

  void _showErrorSnackbar(BuildContext context, String errorMessage) {
    // Implement error message logic here if needed
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Factory method to create TaskProvider instance based on source and userId
  static TaskProvider create({
    required String controllerSource,
    required String controllerUserId,
  }) {
    print(
        'TaskProvider.create: controllerSource: $controllerSource, controllerUserId: $controllerUserId');

    // Example: Logic to determine which controller to use based on controllerSource
    final TaskController taskController = TaskController(
      controllerSource,
      controllerUserId,
    );

    return TaskProvider(taskController);
  }
}
