// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foody/components/button.dart';
import 'package:foody/components/textfield.dart';
import 'package:foody/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onPressed;

  const RegisterPage({super.key, required this.onPressed});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> register() async {
    // register user
    // get auth service
    final _authService = AuthService();

    // check passwords match than create user
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    // check passwords don't match than show error message
    else{
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Passwords don't match",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_outlined,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //message, app name
            Text(
              "Lets Create an Account",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            //email input
            Textfield(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //password input
            Textfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //confirm password input
            Textfield(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),

            const SizedBox(height: 25),

            //Register button
            MyButton(text: "Sign Up", onPressed: register),

            const SizedBox(height: 25),

            //already registered? login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already registered? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: widget.onPressed,
                  child: Text("login here",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
