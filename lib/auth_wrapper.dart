import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:receivo_expense/screens/auth/login_screen.dart';
import 'package:receivo_expense/screens/home/homescreen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Show loading screen while checking authentication state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        // If logged in, show HomeScreen
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        
        // If not logged in, show LoginScreen
        return const LoginScreen();
      },
    );
  }
}