import 'package:isar/isar.dart';

part 'password_model.g.dart';

@Collection()
class PasswordModel {
  Id id = Isar.autoIncrement;
  late String serviceName;
  late String nickName;
  late String passwordId;
}
