import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/pages/home_page.dart';
import 'package:foody/services/auth/login_or_register.dart';

class AuthGete extends StatelessWidget {
  const AuthGete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // is user logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          // user is not logged in
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
