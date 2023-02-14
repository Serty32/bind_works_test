import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/generic/enums/loading_status.dart';
import 'package:test_app/domain/index.dart';

import '../application/auth/auth_bloc.dart';
import '../domain/generic/enums/loading_status.dart';
import '../domain/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pin = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.redirect != null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          }
          if (state.status == LoadingState.isError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
          }
        },
        listenWhen: ((previous, current) => previous.status != current.status),
        builder: ((context, state) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'LOGIN',
                      ),
                      onChanged: (value) => pin = value,
                      onEditingComplete: () => login(pin),
                      validator: (value) {
                        if ((value == null || value.isEmpty)) {
                          return 'Can\'t be empty :)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () => login(pin),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text('GO'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void login(String pin) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            Login(pin: pin),
          );
    }
  }
}
