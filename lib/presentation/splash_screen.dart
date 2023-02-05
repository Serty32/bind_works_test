import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/auth/auth_bloc.dart';
import '../domain/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(
          CheckAuthState(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == LoadingState.isCompleted &&
            state.redirect != null) {
          final redirect = state.redirect;
          if (redirect == null) {
            return;
          }
          switch (redirect) {
            case RedirectTo.createPinScreen:
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/create_pin', (Route<dynamic> route) => false);

              break;
            case RedirectTo.signInScreen:
               Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
              break;

            case RedirectTo.homeScreen:
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
              break;
          }
        }
      },
      child: Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        )),
      ),
    );
  }
}
