import 'package:flutter/material.dart';
import 'package:foody/components/button.dart';
import 'package:foody/components/textfield.dart';
import 'package:foody/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onPressed;

  const LoginPage({super.key, required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() {
    //fill out aouthentication logic here

    //if successful, navigate to home page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
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
              "Food Delivery",
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

            const SizedBox(height: 25),

            //login button
            MyButton(text: "Sign In", onPressed: login),

            const SizedBox(height: 25),

            //not registered? register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not registered? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: widget.onPressed,
                  child: Text("Register here",
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
