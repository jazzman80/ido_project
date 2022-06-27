import 'package:flutter/material.dart';
import 'package:ido_project/completed_list_screen/completed_list_screen.dart';

class TaskListBottomBar extends StatelessWidget {
  const TaskListBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.check_circle_outline_rounded),
            onPressed: () {
              Navigator.pushNamed(
                context,
                CompletedListScreen.route,
              );
            },
          ),
        ],
      ),
      shape: CircularNotchedRectangle(),
    );
  }
}
