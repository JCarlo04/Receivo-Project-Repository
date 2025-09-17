import 'package:flutter/material.dart';
import 'screens/home/views/homescreen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Receivo - Expense Tracker",
      // ikaw bahala dito abe
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: Colors.indigo
        )
      ),
      //till here for ui but you can extend whatevs
      home: HomeScreen(),
      );
  }
}