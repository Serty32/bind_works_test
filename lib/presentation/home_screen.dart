import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: List.generate(
              10,
              (index) => ListTile(
                    title: Text(
                      'Title $index',
                    ),
                    subtitle: Text(
                      'Subtitle $index',
                    ),
                  )).toList()),
    );
  }
}
