import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/application/password/password_bloc.dart';
import 'package:test_app/domain/index.dart';
import 'package:test_app/domain/password/model/password_model.dart';
import 'package:test_app/infra/extensions.dart';
import 'package:test_app/presentation/mixins/password_validation_mixin.dart';
import 'package:test_app/presentation/widgets/detail_text_field.dart';

import '../application/auth/auth_bloc.dart';
import 'args/detail_args.dart';

class DetailScreen extends StatefulWidget {
  final DetailArgs? args;

  const DetailScreen({Key? key, this.args}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with passwordValidationMixin {
  final TextEditingController _pinTextField = TextEditingController();
  bool showPassword = false;
  String initPassword = '';

  bool get isNewForm => widget.args == null;

  @override
  void initState() {
    serviceName = widget.args?.passwordModel.serviceName ?? '';
    nickName = widget.args?.passwordModel.nickName ?? '';

    password = widget.args?.password ?? '';
    validatePassword(password);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        formIsValid = formKey.currentState?.validate() ?? false;
        validateLengthPassword(password);
        validateDigitsLowerCaseUperCaseLettersPassword(password);
        validateSpecialCharactersPassword(password);
        setState(() {});
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Detail Screen'),
        actions: [
          if (!isNewForm)
            IconButton(
              icon: Icon(Icons.delete_outline_outlined),
              onPressed: () {
                context.read<PasswordBloc>().add(
                      DeletePassword(
                        id: widget.args!.passwordModel.id,
                        passwordId: password.getSaltedHash(
                          widget.args!.passwordModel.id.toString(),
                        ),
                      ),
                    );
              },
            )
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<PasswordBloc, PasswordState>(
        listener: ((_, state) {
          if (state.status == LoadingState.isCompleted) {
            if (Navigator.of(context).canPop.call()) {
              Navigator.pop(context);
            }
          }
        }),
        listenWhen: (previous, current) => previous.status != current.status,
        builder: (_, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                DetailTextField(
                  text: serviceName,
                  child: TextFormField(
                    initialValue: serviceName,
                    decoration: InputDecoration(
                      hintText: 'Service name',
                    ),
                    onChanged: (value) {
                      serviceName = value;
                      setState(() {
                        formIsValid = formKey.currentState!.validate();
                      });
                    },
                  ),
                ),
                DetailTextField(
                  text: nickName,
                  child: TextFormField(
                    initialValue: nickName,
                    decoration: InputDecoration(
                      hintText: 'Nick name',
                    ),
                    onChanged: (value) {
                      nickName = value;
                      setState(() {
                        formIsValid = formKey.currentState!.validate();
                      });
                    },
                  ),
                ),
                BlocListener<AuthBloc, AuthState>(
                    listener: ((context, state) {
                      if (state.status == LoadingState.isCompleted) {
                        setState(() {
                          showPassword = true;
                        });
                      } else if (state.status == LoadingState.isError) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                                content: Text('Pin is not the same :(')),
                          );
                      }
                    }),
                    listenWhen: (previous, current) =>
                        previous.status != current.status,
                    child: DetailTextField(
                      text: password,
                      child: TextFormField(
                        initialValue: password,
                        keyboardType: TextInputType.text,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: showPassword
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () async {
                              if (showPassword) {
                                showPassword = !showPassword;
                              } else {
                                final pin = await showDialog<String>(
                                  context: context,
                                  builder: (currContext) => AlertDialog(
                                    title: Text('Enter PIN'),
                                    content: TextField(
                                      autofocus: true,
                                      controller: _pinTextField,
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        child: Text('Check'),
                                        onPressed: () {
                                          Navigator.pop(
                                              currContext, _pinTextField.text);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                                _pinTextField.clear();
                                if (!mounted) return;
                                context.read<AuthBloc>().add(
                                      Login(pin: pin ?? ''),
                                    );
                              }

                              setState(() {});
                            },
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                          setState(() {
                            formIsValid = formKey.currentState!.validate();
                            validateLengthPassword(value);
                            validateDigitsLowerCaseUperCaseLettersPassword(
                                value);
                            validateSpecialCharactersPassword(value);
                          });
                        },
                        validator: (value) => validatePassword(value),
                      ),
                    )),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: passwordValidationLengthIcon,
                        ),
                        Text('At least 5 characters'),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child:
                              passwordValidationDigitsLowerUperCaseLettersIcon,
                        ),
                        Text('Digits, lowercase, and uppercase letters'),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: passwordValidationSpecialCharachtersIcon,
                        ),
                        Text('Special characters (@ # \u0024...)'),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          isSaveButtonActive ? Colors.blueAccent : Colors.grey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (!isSaveButtonActive) return;
                      if (widget.args == null) {
                        context.read<PasswordBloc>().add(
                              AddPassword(
                                passwordModel: PasswordModel()
                                  ..nickName = nickName
                                  ..passwordId = ''
                                  ..serviceName = serviceName,
                                password: password,
                              ),
                            );
                      } else {
                        final model = widget.args!.passwordModel
                          ..nickName = nickName
                          ..passwordId = widget.args!.passwordModel.passwordId
                          ..serviceName = serviceName;
                        context.read<PasswordBloc>().add(
                              ChangePassword(
                                passwordModel: model,
                                password: password,
                              ),
                            );
                      }
                    },
                    child: SizedBox(
                      height: 50,
                      width: double.infinity - 30,
                      child: Center(
                        child: Text('SAVE'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
