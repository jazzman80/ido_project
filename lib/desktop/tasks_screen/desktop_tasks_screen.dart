import 'package:flutter/material.dart';

class DesktopTasksScreen extends StatelessWidget {
  const DesktopTasksScreen({Key? key}) : super(key: key);

  static String route = 'Desktop Tasks Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('This version for desktop and web'),
        ),
        drawer: ListView(
          children: [
            ListTile(
              title: Text('Menu item'),
            ),
            ListTile(
              title: Text('Menu item'),
            ),
            ListTile(
              title: Text('Menu item'),
            )
          ],
        ));
  }
}
