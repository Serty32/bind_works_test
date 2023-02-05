import 'package:dartz/dartz.dart';

import 'package:hive/hive.dart';

import '../../domain/index.dart';

class HiveAuthRepository implements IAuthRepository {
  late Box box;

  HiveAuthRepository() {
    Hive.openBox('user');
  }

  Future<void> isBoxOpen(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      print('Box $boxName is open');
      box = Hive.box(boxName);
    } else {
      await Hive.openBox(boxName);
      box = Hive.box(boxName);
    }
  }

  @override
  Future<Either<AuthFailure, bool>> checkPin({required String pin}) async {
    final pinFromDb = await box.get('pin');
    if (pinFromDb == pin) {
      return right(true);
    } else {
      return left(AuthFailure.unexpected('Some Error :('));
    }
  }

  @override
  Future<void> createPin({required String pin}) async {
    await box.put('pin', pin);
  }

  @override
  Future<bool> hasPin() async {
    await isBoxOpen('pin');
    return await box.get('pin') != null;
  }
}
