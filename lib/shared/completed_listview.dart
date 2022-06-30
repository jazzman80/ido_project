import 'package:flutter/material.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:ido_project/shared/task_listtile.dart';
import 'package:provider/provider.dart';

class CompletedListView extends StatelessWidget {
  const CompletedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessLogic>(
      builder: (context, businessLogic, child) {
        return ListView.builder(
          itemCount: businessLogic.completedList.length,
          itemBuilder: (context, index) {
            return TaskListTile(task: businessLogic.completedList[index]);
          },
        );
      },
    );
  }
}
