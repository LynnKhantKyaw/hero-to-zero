import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_to_zero/db/db_names.dart';
import 'package:hero_to_zero/routes/route_names.dart';
import 'package:hero_to_zero/routes/routes.dart';
import 'package:hero_to_zero/shared/reusable/custom_raised_button.dart';
import 'package:hero_to_zero/shared/reusable/custom_text_button.dart';
import 'package:hero_to_zero/shared/reusable/custom_text_field.dart';
import 'package:hero_to_zero/shared/utils.dart';
import 'package:hero_to_zero/src/auth/model/register_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authDB = Hive.box<RegisterModel>(DBNames.authDb);

  final username = TextEditingController();
  final password = TextEditingController();

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
                controller: username,
              ),
              k2DividerV,
              CustomTextField(
                labelText: 'Password',
                controller: password,
                suffix: const Icon(Icons.visibility_off),
                obscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  label: 'Remember password',
                  color: Colors.grey[600],
                  fontSize: 12,
                  onPressed: () {},
                ),
              ),
              k2DividerV,
              CustomRaisedButton(
                width: double.infinity,
                label: 'Login',
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var data = authDB.get(DBKeys.registerKey);
                  if (data!.username == username.text &&
                      data.password == password.text) {
                    prefs.setBool(kToken, true);
                    GoRouter.of(navigatorKey.currentContext!)
                        .pushNamed(RouteNames.dashboard);
                  } else {
                    print('fail');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final myTokenProvider = StateProvider<bool>((ref) {
  return false;
});
