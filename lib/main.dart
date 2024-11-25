import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'Authenticator.dart';
import 'Dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/dashboard': (context) => Dashboard(role: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}
