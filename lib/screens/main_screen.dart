import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/business_logic/tasks.dart';
import 'package:ido_project/screens/add_task_screen.dart';
import 'package:ido_project/widgets/task_listtile.dart';
import 'package:ido_project/screens/completed_screen.dart';
import 'package:get/get.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(uncompletedTaskProvider);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CompletedScreen());
            },
            icon: const Icon(Icons.check_circle_outline),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            AddTaskScreen(),
            isScrollControlled: false,
            backgroundColor: Colors.white,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return TaskListTile(
              task: taskList[index],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primary,
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: SizedBox(
          height: 60.0,
        ),
      ),
    );
  }
}
