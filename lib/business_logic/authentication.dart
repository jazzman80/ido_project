import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  UserAuth({required this.email, required this.password});

  final String email;
  final String password;
}

final firebaseSignInProvider = FutureProvider.family<void, UserAuth>(
  (ref, user) async => await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: user.email,
    password: user.password,
  ),
);
