import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/business_logic/tasks.dart';

class AddTaskScreen extends ConsumerWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController taskName = TextEditingController();
    final index = (ref.watch(taskProvider).length + 1).toString();

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            controller: taskName,
            decoration: InputDecoration(hintText: 'enter task'),
          ),
          SizedBox(
            height: 40.0,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(taskProvider.notifier).addTask(
                    Task(
                      index: index,
                      name: taskName.text,
                      isCompleted: false,
                    ),
                  );
              taskName.clear();
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
