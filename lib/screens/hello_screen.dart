import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ido_project/screens/login_screen.dart';
import 'package:ido_project/screens/register_screen.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Hello, username!!!'),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
