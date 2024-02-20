import 'package:explora_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ScreenBackgroundColor,
      body: Center(
        child: Text("Hello world"),
      ),
    );
  }
}
