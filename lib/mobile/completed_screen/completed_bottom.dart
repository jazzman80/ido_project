import 'package:flutter/material.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:provider/provider.dart';

class CompletedBottom extends StatelessWidget {
  const CompletedBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: ElevatedButton(
        onPressed: () {
          Provider.of<BusinessLogic>(context, listen: false).clearCompleted();
        },
        child: const Text('Clear Completed'),
      ),
    );
  }
}