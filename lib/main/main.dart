import 'package:flutter/material.dart';
import 'package:ido_project/main/app_theme.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:ido_project/mobile/completed_screen/completed_screen.dart';
import 'package:ido_project/desktop/main_screen/desktop_main_screen.dart';
import 'package:ido_project/mobile/task_screen/task_screen.dart';
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
          ? TaskScreen.route
          : DesktopMainScreen.route,
      routes: {
        TaskScreen.route: (context) => TaskScreen(),
        CompletedScreen.route: (context) => CompletedScreen(),
        DesktopMainScreen.route: (context) => DesktopMainScreen(),
      },
      theme: appTheme(context),
    );
  }
}
