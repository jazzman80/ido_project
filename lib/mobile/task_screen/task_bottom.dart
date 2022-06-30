import 'package:flutter/material.dart';
import 'package:ido_project/mobile/completed_screen/completed_screen.dart';

class TaskBottom extends StatelessWidget {
  const TaskBottom({Key? key}) : super(key: key);

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
                CompletedScreen.route,
              );
            },
          ),
        ],
      ),
      shape: CircularNotchedRectangle(),
    );
  }
}
