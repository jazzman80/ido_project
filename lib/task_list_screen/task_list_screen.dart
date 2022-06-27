import 'package:flutter/material.dart';
import 'package:ido_project/task_list_screen/task_list_bottom_bar.dart';
import 'package:ido_project/task_list_screen/task_list_fab.dart';
import 'package:ido_project/task_list_screen/task_list_view.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

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
      floatingActionButton: TaskListFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TaskListBottomBar(),
    );
  }
}
