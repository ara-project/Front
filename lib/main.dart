import 'package:flutter/material.dart';
import 'package:front_ara/pages/factura.dart';
import 'package:front_ara/pages/home_page.dart';
import 'package:front_ara/pages/login_page.dart';
import 'package:front_ara/pages/main_page.dart';
import 'package:front_ara/pages/register_page.dart';
import 'package:front_ara/pages/perfile_page.dart';

void main() async {
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
        '/login': (context) => const Login(),
        '/perfil': (context) => const Perfil(),
        '/home': (context) => const home(),
        '/detalles':(context) => const Factura()
      },
      title: 'Ara app',
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}
