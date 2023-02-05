import 'package:isar/isar.dart';
import 'package:test_app/domain/auth/failure/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_app/domain/password/model/password_model.dart';

abstract class IPasswordRepository {
  Future<void> addPassword(PasswordModel passwordModel);

  Future<void> deletePassword(int id);

  Future<void> changePassword(PasswordModel passwordModel);

  Future<List<PasswordModel>> getPasswords();

  Stream<void> watchPasswordChange();
}
