import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/application/auth/auth_bloc.dart';
import 'package:test_app/application/password/password_bloc.dart';
import 'package:test_app/domain/index.dart';
import 'package:test_app/domain/password/model/password_model.dart';

import 'args/detail_args.dart';

class DetailScreen extends StatefulWidget {
  final DetailArgs? args;

  const DetailScreen({Key? key, this.args}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool showPassword = false;
  String serviceName = '';
  String nickName = '';
  String password = '';

  @override
  void initState() {
    serviceName = widget.args?.passwordModel.serviceName ?? '';
    nickName = widget.args?.passwordModel.nickName ?? '';
    password = widget.args?.passwordModel.passwordId ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      backgroundColor: Colors.white,
      body: BlocConsumer<PasswordBloc, PasswordState>(
        listener: ((context, state) {
          if (state.status == LoadingState.isCompleted) {
            Navigator.pop(context);
          }
        }),
        listenWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: TextEditingController(
                    text: serviceName,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Service name',
                  ),
                  onChanged: (value) {
                    serviceName = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: TextEditingController(
                    text: nickName,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Nick name',
                  ),
                  onChanged: (value) {
                    nickName = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: TextEditingController(
                    text: password,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: showPassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          showPassword = !showPassword;
                          setState(() {});
                        },
                      )),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(width: 1, color: Colors.black)),
                    ),
                  ),
                  onPressed: () async {
                    if (widget.args == null) {
                      context.read<PasswordBloc>().add(
                            AddPassword(
                              passwordModel: PasswordModel()
                                ..nickName = nickName
                                ..passwordId = password
                                ..serviceName = serviceName,
                            ),
                          );
                    } else {
                      context.read<PasswordBloc>().add(
                            ChangePassword(
                              passwordModel: PasswordModel()
                                ..nickName = nickName
                                ..passwordId = password
                                ..serviceName = serviceName,
                            ),
                          );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity - 20,
                    child: Center(
                      child: Text('SAVE'),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
