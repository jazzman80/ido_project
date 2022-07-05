import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/business_logic/tasks.dart';
import 'package:ido_project/screens/add_task_screen.dart';
import 'package:ido_project/widgets/task_listtile.dart';
import 'package:ido_project/screens/completed_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  static String route = 'Main Screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(uncompletedTaskProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                CompletedScreen.route,
              );
            },
            icon: const Icon(Icons.check_circle_outline),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return AddTaskScreen();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return TaskListTile(
              taskList: taskList,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
