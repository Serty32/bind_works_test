import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/domain/password/i_password_repository.dart';
import 'package:test_app/domain/password/model/password_model.dart';
import 'package:test_app/infra/extensions.dart';
import '../../domain/index.dart';
import '../../domain/password/i_secure_storage.dart';

part 'password_bloc.freezed.dart';
part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final IPasswordRepository passwordRepository;
  final ISecureStorage secureStorage;

  late final StreamSubscription passwordsSubscription;

  PasswordBloc({
    required this.passwordRepository,
    required this.secureStorage,
  }) : super(PasswordState.initialize()) {
    passwordsSubscription =
        passwordRepository.watchPasswordChange().listen((_) {
      add(GetPasswords());
    });
    on<GetPasswords>(_getPasswords);
    on<GetPassword>(_getPassword);
    on<AddPassword>(_addPassword);
    on<ChangePassword>(_changePassword);
    on<DeletePassword>(_deletePassword);
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

  Future<void> _getPassword(
      GetPassword event, Emitter<PasswordState> emit) async {
    emit(
      state.copyWith(
        status: LoadingState.isLoading,
      ),
    );

    final result = await secureStorage.getPassword(id: event.id);

    emit(
      state.copyWith(
        password: result ?? '',
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

    final passwordId = event.password.getSaltedHash(
      event.passwordModel.id.toString(),
    );

    secureStorage.setPassword(
      id: passwordId,
      password: event.password,
    );

    event.passwordModel.passwordId = passwordId;
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

    if (event.password != null) {
      final passwordId = event.password!.getSaltedHash(
        event.passwordModel.id.toString(),
      );

      event.passwordModel.passwordId = passwordId;

      secureStorage.deletePassword(event.passwordModel.passwordId);
      secureStorage.setPassword(id: passwordId, password: event.password!);
    }

    passwordRepository.changePassword(event.passwordModel);

    emit(
      state.copyWith(
        status: LoadingState.isCompleted,
      ),
    );
  }

  Future<void> _deletePassword(
      DeletePassword event, Emitter<PasswordState> emit) async {
    emit(
      state.copyWith(
        status: LoadingState.isLoading,
      ),
    );

    secureStorage.deletePassword(event.passwordId);

    passwordRepository.deletePassword(event.id);

    emit(
      state.copyWith(
        status: LoadingState.isCompleted,
      ),
    );
  }

  Future<String?> getPassword(String passwordId) async {
    return await secureStorage.getPassword(id: passwordId);
  }
}
