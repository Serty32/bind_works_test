import 'package:isar/isar.dart';
import 'package:test_app/application/auth/auth_bloc.dart';
import 'package:test_app/domain/index.dart';
import 'package:test_app/domain/password/i_password_repository.dart';
import 'package:test_app/domain/password/model/password_model.dart';
import 'package:test_app/infra/auth/hive_user_repository.dart';
import 'package:test_app/infra/password/isar_password_repository.dart';
import 'package:test_app/presentation/args/detail_args.dart';
import 'package:test_app/presentation/create_pin_screen.dart';
import 'package:test_app/presentation/detail_screen.dart';
import 'package:test_app/presentation/home_screen.dart';
import 'package:test_app/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'application/password/password_bloc.dart';
import 'presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final isar = await Isar.open([PasswordModelSchema]);

  GetIt.I.registerSingleton<IAuthRepository>(HiveAuthRepository());
  GetIt.I.registerSingleton<IPasswordRepository>(IsarPasswordRepository(isar));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bind Works',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFF7FAFD),
          brightness: Brightness.light),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: GetIt.I<IAuthRepository>(),
            ),
            child: SplashScreen(),
          );
        },
        '/create_pin': (context) {
          return BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: GetIt.I<IAuthRepository>(),
            ),
            child: CreatePinScreen(),
          );
        },
        '/login': (context) {
          return BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: GetIt.I<IAuthRepository>(),
            ),
            child: LoginScreen(),
          );
        },
        '/home': (context) {
          return BlocProvider<PasswordBloc>(
            create: (context) => PasswordBloc(
              passwordRepository: GetIt.I<IPasswordRepository>(),
            ),
            child: HomeScreen(),
          );
        },
        '/detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as DetailArgs?;

          return BlocProvider<PasswordBloc>(
            create: (context) => PasswordBloc(
              passwordRepository: GetIt.I<IPasswordRepository>(),
            ),
            child: DetailScreen(
              args: args,
            ),
          );
        }
      },
    );
  }
}
