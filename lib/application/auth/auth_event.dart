part of 'auth_bloc.dart';


abstract class AuthEvent {}


class CheckAuthState extends AuthEvent {}

class CreatePin extends AuthEvent {
  final String pin;
  CreatePin({
    required this.pin,
  });
}

class Login extends AuthEvent {
  final String pin;
  Login({
    required this.pin,
  });
}
