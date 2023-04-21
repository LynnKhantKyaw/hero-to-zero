import 'package:objectbox/objectbox.dart';

@Entity()
class RegisterModel {
  @Id()
  int id;
  String username;
  String email;
  String password;
  String confirmpassword;
  RegisterModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.confirmpassword});
}
