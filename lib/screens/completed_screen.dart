import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/business_logic/tasks.dart';
import 'package:ido_project/widgets/task_listtile.dart';

class CompletedScreen extends ConsumerWidget {
  const CompletedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(completedTaskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.delete_forever),
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
