part of 'password_bloc.dart';


abstract class PasswordEvent {}


class GetPasswords extends PasswordEvent {}

class ChangePassword extends PasswordEvent {
  final PasswordModel passwordModel;
  ChangePassword({
    required this.passwordModel,
  });
}

class AddPassword extends PasswordEvent {
  final PasswordModel passwordModel;
  AddPassword({
    required this.passwordModel,
  });
}

class DeletePassword extends PasswordEvent {
  final int id;
  DeletePassword({
    required this.id,
  });
}
