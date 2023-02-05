import 'package:dartz/dartz.dart';
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
      final password = await isar.passwordModels.get(passwordModel.id);
      if (password != null) {
        password.serviceName = passwordModel.serviceName;
        password.nickName = passwordModel.nickName;
        password.passwordId = passwordModel.passwordId;

        await isar.passwordModels.put(password);
      }
    });
  }

  @override
  Future<void> deletePassword(int id) async {
    await isar.writeTxn(() async {
      final isDeleted = await isar.passwordModels.delete(id);
      print('Recipe deleted: $isDeleted');
    });
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
