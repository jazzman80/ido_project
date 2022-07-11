import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskName = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            controller: taskName,
            decoration: const InputDecoration(hintText: 'enter task'),
          ),
          const SizedBox(
            height: 40.0,
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection(FirebaseAuth.instance.currentUser!.uid)
                  .add({
                'name': taskName.text,
                'isCompleted': false,
              });
              taskName.clear();
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
