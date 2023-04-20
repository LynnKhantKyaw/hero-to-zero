import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hero_to_zero/db/db_names.dart';
import 'package:hero_to_zero/shared/reusable/custom_raised_button.dart';
import 'package:hero_to_zero/shared/reusable/custom_text_button.dart';
import 'package:hero_to_zero/shared/reusable/custom_text_field.dart';
import 'package:hero_to_zero/shared/utils.dart';
import 'package:hero_to_zero/src/auth/model/register_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var authDb = Hive.box('register');

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create an account',
                style: TextStyle(fontSize: 24),
              ).animate().slideY(duration: duration),
              const SizedBox(height: 5),
              Text(
                'Register now and learn more ( Hero to Zero )',
                style: TextStyle(
                    fontSize: 18, color: Colors.grey.withOpacity(0.6)),
              ).animate().scale(duration: duration),
              k3DividerV,
              CustomTextField(
                labelText: 'Username',
                controller: userNameController,
              ),
              k2DividerV,
              CustomTextField(
                labelText: 'Email',
                controller: emailController,
              ),
              k2DividerV,
              CustomTextField(
                labelText: 'Password',
                controller: passwordController,
              ),
              k2DividerV,
              CustomTextField(
                labelText: 'Confirm Password',
                controller: confirmPasswordController,
              ),
              k3DividerV,
              CustomRaisedButton(
                // bgcolor: Colors.purple,
                width: double.infinity,
                label: 'Create Account',
                onPressed: () async {
                  var data = RegisterModel(
                    username: userNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    confirmpassword: confirmPasswordController.text,
                  );
                  authDb.put('register', data);
                  setState(() {});
                },
              ),
              kDividerV,
              CustomTextButton(
                label: 'Sign in',
                onPressed: () {
                  print(
                      '${authDb.get(DBKeys.registerKey)}         auth db data');
                  //  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
