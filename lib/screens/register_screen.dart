import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ido_project/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:ido_project/widgets/snackbars.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = TextEditingController();
    final password = TextEditingController();

    void register() async {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        FirebaseFirestore.instance
            .collection(FirebaseAuth.instance.currentUser!.uid)
            .add({
          'name': 'Check this task',
          'isCompleted': false,
        });
        FirebaseFirestore.instance
            .collection(FirebaseAuth.instance.currentUser!.uid)
            .add({
          'name': 'Try to add another one',
          'isCompleted': false,
        });
        FirebaseFirestore.instance
            .collection(FirebaseAuth.instance.currentUser!.uid)
            .add({
          'name':
              'View list of completed tasks by pressing checkmark icon on top-right',
          'isCompleted': false,
        });
        Get.offAll(() => MainScreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          errorSnackbar('Password is too weak');
        } else if (e.code == 'email-already-in-use') {
          errorSnackbar('The account already exists for that email');
        } else if (e.code == 'invalid-email') {
          errorSnackbar('Invalid email');
        }
      } catch (e) {
        errorSnackbar(e.toString());
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: email,
                    decoration:
                        const InputDecoration(hintText: 'enter your email'),
                  ),
                  TextField(
                    controller: password,
                    decoration:
                        const InputDecoration(hintText: 'enter your password'),
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                  SizedBox(
                    width: 200.0,
                    child: ElevatedButton(
                      onPressed: () => register(),
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
