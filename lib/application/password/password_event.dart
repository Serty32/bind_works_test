part of 'password_bloc.dart';

abstract class PasswordEvent {}

class GetPasswords extends PasswordEvent {}

class GetPassword extends PasswordEvent {
  final String id;

  GetPassword({
    required this.id,
  });
}


class ChangePassword extends PasswordEvent {
  final PasswordModel passwordModel;
  final String? password;

  ChangePassword({
    required this.passwordModel,
    this.password,
  });
}

class AddPassword extends PasswordEvent {
  final PasswordModel passwordModel;
  final String password;
  AddPassword({
    required this.passwordModel,
    required this.password,
  });
}

class DeletePassword extends PasswordEvent {
  final int id;
  final String passwordId;
  DeletePassword({
    required this.id,
    required this.passwordId,
  });
}
