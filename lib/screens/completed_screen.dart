import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/business_logic/tasks.dart';
import 'package:ido_project/widgets/task_listtile.dart';

class CompletedScreen extends ConsumerWidget {
  const CompletedScreen({
    Key? key,
  }) : super(key: key);

  static String route = 'Completed Screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(completedTaskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
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
