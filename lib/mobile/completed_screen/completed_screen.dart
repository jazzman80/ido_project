import 'package:flutter/material.dart';
import 'package:ido_project/shared/completed_listview.dart';
import 'package:ido_project/mobile/completed_screen/completed_bottom.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  static String route = 'Completed List Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
      ),
      body: SafeArea(
        child: CompletedListView(),
      ),
      bottomNavigationBar: CompletedBottom(),
    );
  }
}
