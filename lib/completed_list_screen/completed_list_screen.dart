import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ido_project/completed_list_screen/completed_list_bottom.dart';
import 'package:ido_project/completed_list_screen/completed_list_view.dart';

class CompletedListScreen extends StatelessWidget {
  const CompletedListScreen({Key? key}) : super(key: key);

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
      bottomNavigationBar: CompletedListBottom(),
    );
  }
}
