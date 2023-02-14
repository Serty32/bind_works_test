import 'package:test_app/domain/password/model/password_model.dart';

class DetailArgs {
  final PasswordModel passwordModel;
  final String password;

  DetailArgs(
    this.passwordModel,
    this.password,
  );
}
