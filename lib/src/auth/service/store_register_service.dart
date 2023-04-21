import 'package:hero_to_zero/objectbox.g.dart';
import 'package:hero_to_zero/src/auth/model/register/register_model.dart';

class ObjectBox {
  late final Store store;
  late final Box<RegisterModel> _box;

  ObjectBox._init(this.store) {
    _box = Box<RegisterModel>(store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._init(store);
  }

  RegisterModel? getUser(int id) => _box.get(id);

  Stream<List<RegisterModel>> getUsers() =>
      _box.query().watch(triggerImmediately: true).map((query) => query.find());

  int insertUser(RegisterModel model) => _box.put(model);

  bool deleteUser(int id) => _box.remove(id);
}
