import 'package:flutter/material.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:ido_project/task_list_screen/task_list_tile.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessLogic>(
      builder: (context, businessLogic, child) {
        return ListView.builder(
          itemCount: businessLogic.uncompletedList.length,
          itemBuilder: (context, index) {
            return TaskListTile(task: businessLogic.uncompletedList[index]);
          },
        );
      },
    );
  }
}
