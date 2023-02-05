part of 'password_bloc.dart';

@freezed
class PasswordState with _$PasswordState {
  const factory PasswordState({
    required LoadingState status,
    @Default([])
    List<PasswordModel> passwordList,
  }) = _PasswordState;

  factory PasswordState.initialize() => const PasswordState(
        status: LoadingState.isInitial,
        passwordList: [],
      );
}
