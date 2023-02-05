part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required LoadingState status,
    RedirectTo? redirect,
  }) = _AuthState;
  factory AuthState.initialize() => const AuthState(
        status: LoadingState.isInitial,
      );
}
