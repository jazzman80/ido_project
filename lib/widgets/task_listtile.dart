import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/business_logic/tasks.dart';

class TaskListTile extends ConsumerWidget {
  const TaskListTile({
    Key? key,
    required this.taskList,
    required this.index,
  }) : super(key: key);

  final List<Task> taskList;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      value: taskList[index].isCompleted,
      onChanged: (value) =>
          ref.read(taskProvider.notifier).checkTask(taskList[index].index),
      title: Text(taskList[index].name),
    );
  }
}
