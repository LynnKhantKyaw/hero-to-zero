import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class RegisterModel extends HiveObject {
  @HiveField(0)
  String username;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  String confirmpassword;
  RegisterModel(
      {required this.username,
      required this.email,
      required this.password,
      required this.confirmpassword});
}
