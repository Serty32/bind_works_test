import 'package:test_app/domain/auth/failure/auth_failure.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, bool>> checkPin({
    required String pin,
  });

  Future<void> createPin({
    required String pin,
  });

  Future<bool> hasPin();
}
