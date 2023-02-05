import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/application/auth/auth_bloc.dart';
import 'package:test_app/application/password/password_bloc.dart';
import 'package:test_app/domain/index.dart';
import 'package:test_app/presentation/args/detail_args.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<PasswordBloc>().add(GetPasswords());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      backgroundColor: Colors.white,
      body: BlocBuilder<PasswordBloc, PasswordState>(
        builder: (context, state) {
          if (state.status == LoadingState.isLoading) {
            return CircularProgressIndicator();
          }
          return RefreshIndicator(
            child: state.passwordList.isEmpty
                ? Center(
                    child: Text('No elements so far'),
                  )
                : ListView.builder(
                    itemCount: state.passwordList.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          print('tappeD');
                          Navigator.of(context).pushNamed(
                            '/detail',
                            arguments: DetailArgs(
                              state.passwordList[index],
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(state.passwordList[index].serviceName),
                          subtitle: Text(
                            state.passwordList[index].nickName,
                          ),
                        ),
                      );
                    }),
                  ),
            onRefresh: () {
              return Future.delayed(Duration(seconds: 1), () {
                context.read<PasswordBloc>().add(GetPasswords());
                setState(() {});
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/detail',
            );
          }),
    );
  }
}
