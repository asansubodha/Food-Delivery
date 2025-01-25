import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foody/services/auth/auth_gete.dart';
import 'package:foody/firebase_options.dart';
import 'package:foody/models/restaurant.dart';
import 'package:foody/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: const AuthGete(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
