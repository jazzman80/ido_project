import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ido_project/business_logic/task.dart';

class BusinessLogic extends ChangeNotifier {
  BusinessLogic() {
    _updateLists();
    notifyListeners();
  }

  List<Task> _taskList = [
    Task(name: 'Check this task'),
    Task(name: 'Add another one task'),
  ];

  List<Task> _completedList = [];
  List<Task> _uncompletedList = [];

  List<Task> get taskList {
    return _taskList;
  }

  List<Task> get completedList {
    return _completedList;
  }

  List<Task> get uncompletedList {
    return _uncompletedList;
  }

  String _selectedList = 'Task List';
  String get selectedList {
    return _selectedList;
  }

  void checkTask(Task taskToCheck) {
    taskToCheck.isCompleted = !taskToCheck.isCompleted;
    notifyListeners();
    Timer(const Duration(seconds: 1), () {
      _updateLists();
      notifyListeners();
    });
  }

  void _updateLists() {
    _completedList.clear();
    _uncompletedList.clear();
    for (Task task in _taskList) {
      if (task.isCompleted) {
        _completedList.add(task);
      } else {
        _uncompletedList.add(task);
      }
    }
  }

  void addTask(String taskName) {
    _taskList.add(
      Task(name: taskName),
    );
    _updateLists();
    notifyListeners();
  }

  void clearCompleted() {
    _taskList.removeWhere((task) => task.isCompleted);
    _updateLists();
    notifyListeners();
  }

  void selectList(String selectList) {
    _selectedList = selectList;
    notifyListeners();
  }
}
