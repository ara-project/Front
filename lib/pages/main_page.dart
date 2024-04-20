import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
            height: height,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(240, 42, 44, 1), // Color de fondo
            ),
            child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/aralog.png',
                        height: height * 0.5,
                      ),
                      SizedBox(height: (0.04 * height)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/detalles');
                                },
                                child: Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: _styleButton()),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text(
                                'Regístrarte',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              style: _styleButton(),
                            ),
                            const SizedBox(height: 10),
                          ])
                    ]))));
  }

  ButtonStyle _styleButton() {
    return ButtonStyle(
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20)),
        textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromRGBO(255, 202, 39, 1),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        )));
  }
}
