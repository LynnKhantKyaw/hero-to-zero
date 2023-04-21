import 'package:flutter/material.dart';
import 'package:hero_to_zero/src/auth/model/register/register_model.dart';
import 'package:hero_to_zero/src/auth/service/store_register_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Stream<List<RegisterModel>> streamUser;

  ObjectBox? _objectBox;

  @override
  void initState() {
    if (_objectBox == null) {}
    streamUser = _objectBox!.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return const Text('data');
                },
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: 1),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        var data = RegisterModel(
            id: 0,
            username: 'username',
            email: 'email',
            password: 'password',
            confirmpassword: 'confirmpassword');
        _objectBox!.insertUser(data);
      }),
    );
  }
}
