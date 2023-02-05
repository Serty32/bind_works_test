import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/domain/password/i_password_repository.dart';
import 'package:test_app/domain/password/model/password_model.dart';
import '../../domain/index.dart';

part 'password_bloc.freezed.dart';
part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final IPasswordRepository passwordRepository;
  late final StreamSubscription passwordsSubscription;

  PasswordBloc({
    required this.passwordRepository,
  }) : super(PasswordState.initialize()) {
    passwordsSubscription =
        passwordRepository.watchPasswordChange().listen((_) {
      print('Changed!');
      add(GetPasswords());
    });
    on<GetPasswords>(_getPasswords);
    on<AddPassword>(_addPassword);
    on<ChangePassword>(_changePassword);
  }

  @override
  Future<void> close() {
    passwordsSubscription.cancel();
    return super.close();
  }

  Future<void> _getPasswords(
      GetPasswords event, Emitter<PasswordState> emit) async {
    emit(
      state.copyWith(
        status: LoadingState.isLoading,
      ),
    );

    final result = await passwordRepository.getPasswords();

    emit(
      state.copyWith(
        status: LoadingState.isCompleted,
        passwordList: result,
      ),
    );
  }

  Future<void> _addPassword(
      AddPassword event, Emitter<PasswordState> emit) async {
    emit(
      state.copyWith(
        status: LoadingState.isLoading,
      ),
    );

    passwordRepository.addPassword(event.passwordModel);

    emit(
      state.copyWith(
        status: LoadingState.isCompleted,
      ),
    );
  }

  Future<void> _changePassword(
      ChangePassword event, Emitter<PasswordState> emit) async {
    emit(
      state.copyWith(
        status: LoadingState.isLoading,
      ),
    );

    passwordRepository.changePassword(event.passwordModel);

    emit(
      state.copyWith(
        status: LoadingState.isCompleted,
      ),
    );
  }
}
