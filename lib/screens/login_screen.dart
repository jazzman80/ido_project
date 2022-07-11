import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ido_project/screens/main_screen.dart';

import '../widgets/snackbars.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = TextEditingController();
    final password = TextEditingController();

    void login() async {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        Get.offAll(() => MainScreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          errorSnackbar('User with this email is not registered');
        } else if (e.code == 'wrong-password') {
          errorSnackbar('Wrong password provided for that user');
        } else if (e.code == 'invalid-email') {
          errorSnackbar('Invalid email');
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: email,
                    decoration: InputDecoration(hintText: 'enter your email'),
                  ),
                  TextField(
                    controller: password,
                    decoration:
                        InputDecoration(hintText: 'enter your password'),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  SizedBox(
                    width: 200.0,
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Text('Login'),
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
