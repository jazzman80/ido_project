import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/screens/completed_screen.dart';

import '../screens/main_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: IDoApp(),
    ),
  );
}

class IDoApp extends StatelessWidget {
  const IDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.route,
      routes: {
        MainScreen.route: (context) => MainScreen(),
        CompletedScreen.route: (context) => CompletedScreen(),
      },
    );
  }
}
