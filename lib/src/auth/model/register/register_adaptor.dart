import 'package:hero_to_zero/src/auth/model/register/register_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterAdaptor extends TypeAdapter<RegisterModel> {
  @override
  final int typeId = 0;

  @override
  RegisterModel read(BinaryReader reader) {
    final username = reader.readString();
    final email = reader.readString();
    final password = reader.readString();
    final confirmPassword = reader.readString();
    return RegisterModel(
        username: username,
        email: email,
        password: password,
        confirmpassword: confirmPassword);
  }

  @override
  void write(BinaryWriter writer, RegisterModel obj) {
    writer.writeString(obj.username);
    writer.writeString(obj.email);
    writer.writeString(obj.password);
    writer.writeString(obj.confirmpassword);
  }
}
