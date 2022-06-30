import 'package:flutter/material.dart';
import 'package:ido_project/mobile/task_screen/task_bottom.dart';
import 'package:ido_project/mobile/task_screen/task_fab.dart';
import 'package:ido_project/shared/task_listview.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static String route = 'Task List Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: SafeArea(
        child: TaskListView(),
      ),
      floatingActionButton: TaskFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TaskBottom(),
    );
  }
}
