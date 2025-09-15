import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Receivo - Expense Tracker"),
        ),
        body: const Center(
          child: Text("Welcome to Receivo - Expense Tracker!"),
        ),
      ),
    );
  }
}