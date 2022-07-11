import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

@immutable
class Task {
  const Task({
    required this.id,
    required this.name,
    required this.isCompleted,
  });

  final String id;
  final String name;
  final bool isCompleted;
}

final taskStreamProvider = StreamProvider<QuerySnapshot>((ref) =>
    FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .snapshots());

final taskProvider = Provider<List<Task>>((ref) {
  final stream = ref.watch(taskStreamProvider);

  return stream.value != null
      ? [
          for (final task in stream.value!.docs)
            Task(
              id: task.id,
              name: task['name'],
              isCompleted: task['isCompleted'],
            )
        ]
      : [];
});

final uncompletedTaskProvider = Provider((ref) {
  final taskList = ref.watch(taskProvider);

  return taskList.where((task) => !task.isCompleted).toList();
});

final completedTaskProvider = Provider((ref) {
  final taskList = ref.watch(taskProvider);

  return taskList.where((task) => task.isCompleted).toList();
});
