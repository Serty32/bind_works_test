import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/auth/auth_bloc.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  State<CreatePinScreen> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePinScreen> {
  String pin = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create PIN'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.redirect != null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
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
                        hintText: 'CREATE PIN',
                      ),
                      onChanged: (value) => pin = value,
                      onEditingComplete: () => createPin(pin),
                      validator: (value) {
                        if ((value == null || value.isEmpty)) {
                          return 'Write at least something, please :)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () => createPin(pin),
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
                          child: Text('CREATE'),
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

  void createPin(String pin) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            CreatePin(pin: pin),
          );
    }
  }
}
