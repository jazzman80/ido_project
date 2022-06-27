import 'package:flutter/material.dart';
import 'package:ido_project/add_task_screen/add_task_screen.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:ido_project/completed_list_screen/completed_list_view.dart';
import 'package:ido_project/task_list_screen/task_list_view.dart';
import 'package:provider/provider.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({Key? key}) : super(key: key);

  Widget getList(context) {
    switch (Provider.of<BusinessLogic>(context).selectedList) {
      case 'Task List':
        return TaskListView();
        break;
      case 'Completed List':
        return CompletedListView();
        break;
      default:
        return TaskListView();
    }
  }

  Widget getBottom(context) {
    switch (Provider.of<BusinessLogic>(context).selectedList) {
      case 'Task List':
        return AddTaskScreen();
        break;
      case 'Completed List':
        return ElevatedButton(
          onPressed: () {
            Provider.of<BusinessLogic>(context, listen: false).clearCompleted();
          },
          child: Text('Clear Completed'),
        );
        break;
      default:
        return AddTaskScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: Colors.white,
          width: 500.0,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: getList(context),
              ),
              getBottom(context),
            ],
          ),
        ),
      ),
    );
  }
}
