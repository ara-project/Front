import 'package:flutter/material.dart';
import 'package:front_ara/pages/login.dart';
import 'package:front_ara/pages/mainpage.dart';
import 'package:front_ara/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => const Register(),
        '/login': (context) => const Login()
      },
      title: 'Ara app',
      home: Scaffold(
        body:
            MainPage(), // Suponiendo que tienes una pantalla de inicio de sesión llamada Login
      ),
    );
  }
}
