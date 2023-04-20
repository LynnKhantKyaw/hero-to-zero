import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_to_zero/db/db_names.dart';
import 'package:hero_to_zero/routes/route_names.dart';
import 'package:hero_to_zero/routes/routes.dart';
import 'package:hero_to_zero/src/auth/model/register/register_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static var authDB = Hive.box<RegisterModel>(DBNames.authDb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  for (var i in prefs.getKeys()) {
                    prefs.remove(i);
                  }
                  GoRouter.of(navigatorKey.currentContext!)
                      .pushNamed(RouteNames.initalPage);
                },
                child: Text(authDB.get(DBKeys.registerKey)!.username)),
          ],
        ),
      ),
    );
  }
}
