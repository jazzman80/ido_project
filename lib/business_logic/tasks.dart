import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

@immutable
class Task {
  const Task({
    required this.index,
    required this.name,
    required this.isCompleted,
  });

  final String index;
  final String name;
  final bool isCompleted;

  Task copyWith({String? index, String? name, bool? isCompleted}) {
    return Task(
      index: index ?? this.index,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier()
      : super([
          Task(
            index: '0',
            name: 'Check this task',
            isCompleted: false,
          ),
          Task(
            index: '1',
            name: 'Try to add another one',
            isCompleted: false,
          ),
        ]);

  void addTask(Task task) {
    state = [...state, task];
  }

  void removeTask(String index) {
    state = [
      for (final task in state)
        if (index != task.index) task,
    ];
  }

  void checkTask(String index) {
    state = [
      for (final task in state)
        if (index != task.index)
          task
        else
          task.copyWith(isCompleted: !task.isCompleted),
    ];
  }
}

final taskProvider =
    StateNotifierProvider<TaskNotifier, List<Task>>((ref) => TaskNotifier());

final uncompletedTaskProvider = Provider((ref) {
  final taskList = ref.watch(taskProvider);
  return taskList.where((task) => !task.isCompleted).toList();
});

final completedTaskProvider = Provider((ref) {
  final taskList = ref.watch(taskProvider);

  return taskList.where((task) => task.isCompleted).toList();
});
