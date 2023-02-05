import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/index.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

enum RedirectTo {
  createPinScreen,
  signInScreen,
  homeScreen,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.initialize()) {
    on<CheckAuthState>(_checkState);
    on<CreatePin>(_createPin);
    on<Login>(_login);
  }

  Future<void> _login(Login event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        status: LoadingState.isLoading,
      ),
    );

    final result = await authRepository.checkPin(pin: event.pin);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: LoadingState.isError,
        ),
      ),
      (success) => emit(
        state.copyWith(
          status: success ? LoadingState.isCompleted : LoadingState.isError,
          redirect: success ? RedirectTo.homeScreen : null,
        ),
      ),
    );
  }

  Future<void> _createPin(CreatePin event, Emitter<AuthState> emit) async {
    await authRepository.createPin(pin: event.pin);
    emit(
      state.copyWith(
        status: LoadingState.isCompleted,
        redirect: RedirectTo.homeScreen,
      ),
    );
  }

  Future<void> _checkState(
      CheckAuthState event, Emitter<AuthState> emit) async {
    if (await authRepository.hasPin()) {
      emit(
        state.copyWith(
          status: LoadingState.isCompleted,
          redirect: RedirectTo.signInScreen,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: LoadingState.isCompleted,
          redirect: RedirectTo.createPinScreen,
        ),
      );
    }
  }
}
