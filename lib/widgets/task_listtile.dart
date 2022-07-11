import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/business_logic/tasks.dart';

class TaskListTile extends ConsumerWidget {
  const TaskListTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      value: task.isCompleted,
      onChanged: (value) {
        FirebaseFirestore.instance
            .collection(FirebaseAuth.instance.currentUser!.uid)
            .doc(task.id)
            .update({'isCompleted': value});
      },
      title: Text(task.name),
    );
  }
}
