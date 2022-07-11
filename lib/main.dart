import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ido_project/screens/completed_screen.dart';
import 'package:ido_project/screens/hello_screen.dart';
import 'package:ido_project/screens/login_screen.dart';
import 'package:ido_project/screens/register_screen.dart';
import 'package:ido_project/firebase_options.dart';
import 'package:ido_project/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: IDoApp(),
    ),
  );
}

class IDoApp extends StatelessWidget {
  const IDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FirebaseAuth.instance.currentUser == null
          ? HelloScreen()
          : MainScreen(),
    );
  }
}
