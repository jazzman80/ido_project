import 'package:flutter/material.dart';
import 'package:ido_project/shared/add_task_screen/add_task_screen.dart';

class TaskFab extends StatelessWidget {
  const TaskFab({Key? key}) : super(key: key);

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
