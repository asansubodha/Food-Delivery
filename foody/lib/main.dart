import 'package:flutter/material.dart';
import 'package:foody/auth/login_or_register.dart';
import 'package:foody/models/restaurant.dart';
import 'package:foody/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Provider for ThemeProvider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

        // resturent provider
        ChangeNotifierProvider(
          create: (context) => Restaurant(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
