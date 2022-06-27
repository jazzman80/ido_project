import 'package:flutter/material.dart';
import 'package:ido_project/add_task_screen/add_task_screen.dart';

class TaskListFab extends StatelessWidget {
  const TaskListFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => AddTaskScreen(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
