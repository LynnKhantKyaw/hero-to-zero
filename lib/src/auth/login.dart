import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hero_to_zero/shared/reusable/custom_text_field.dart';
import 'package:hero_to_zero/shared/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello!',
                style: TextStyle(fontSize: 24),
              ).animate().slideY(duration: duration, begin: -3),
              const SizedBox(height: 5),
              Text(
                'Welcome back you\'ve been missed',
                style: TextStyle(
                    fontSize: 18, color: Colors.grey.withOpacity(0.6)),
              ).animate().scale(duration: duration),
              k3DividerV,
              CustomTextField(
                labelText: 'Username',
                controller: TextEditingController(),
              ),
              k2DividerV,
              CustomTextField(
                labelText: 'Password',
                controller: TextEditingController(),
                suffix: const Icon(Icons.visibility_off),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
