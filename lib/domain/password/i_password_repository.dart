import 'package:test_app/domain/password/model/password_model.dart';

abstract class IPasswordRepository {
  Future<void> addPassword(PasswordModel passwordModel);

  Future<bool> deletePassword(int id);

  Future<void> changePassword(PasswordModel passwordModel);

  Future<List<PasswordModel>> getPasswords();

  Stream<void> watchPasswordChange();
}
