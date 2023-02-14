import 'package:isar/isar.dart';

import 'package:test_app/domain/password/i_password_repository.dart';
import 'package:test_app/domain/password/model/password_model.dart';

class IsarPasswordRepository implements IPasswordRepository {
  final Isar isar;

  IsarPasswordRepository(this.isar);

  @override
  Future<void> addPassword(PasswordModel passwordModel) async {
    await isar.writeTxn(() async {
      await isar.passwordModels.put(passwordModel);
    });
  }
  @override
  Future<void> changePassword(PasswordModel passwordModel) async {
    await isar.writeTxn(() async {
      final oldPasswordModel = await isar.passwordModels.get(passwordModel.id);
      if (oldPasswordModel != null) {
        oldPasswordModel.serviceName = passwordModel.serviceName;
        oldPasswordModel.nickName = passwordModel.nickName;
        oldPasswordModel.passwordId = passwordModel.passwordId;

        await isar.passwordModels.put(oldPasswordModel);
      }
    });
  }

  @override
  Future<bool> deletePassword(int id) async {
    await isar.writeTxn(() async {
      final isDeleted = await isar.passwordModels.delete(id);
      return isDeleted;
    });
    return false;
  }

  @override
  Future<List<PasswordModel>> getPasswords() async {
    return isar.collection<PasswordModel>().where().findAll();
  }

  @override
  Stream<void> watchPasswordChange() {
    return isar.passwordModels.watchLazy();
  }
}
