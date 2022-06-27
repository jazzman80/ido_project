import 'package:flutter/material.dart';
import 'package:ido_project/app_theme.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:ido_project/completed_list_screen/completed_list_screen.dart';
import 'package:ido_project/desktop/tasks_screen/desktop_tasks_screen.dart';
import 'package:ido_project/task_list_screen/task_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => BusinessLogic(),
        child: const IdoProject(),
      ),
    );

class IdoProject extends StatelessWidget {
  const IdoProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Theme.of(context).platform == TargetPlatform.android ||
              Theme.of(context).platform == TargetPlatform.iOS
          ? TaskListScreen.route
          : DesktopTasksScreen.route,
      routes: {
        TaskListScreen.route: (context) => TaskListScreen(),
        CompletedListScreen.route: (context) => CompletedListScreen(),
        DesktopTasksScreen.route: (context) => DesktopTasksScreen(),
      },
      theme: appTheme(context),
    );
  }
}
