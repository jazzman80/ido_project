import 'package:flutter/material.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:ido_project/business_logic/task.dart';
import 'package:provider/provider.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: task.isCompleted,
      onChanged: (value) {
        Provider.of<BusinessLogic>(context, listen: false).checkTask(task);
      },
      title: Text(
        task.name,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
      ),
    );
  }
}
