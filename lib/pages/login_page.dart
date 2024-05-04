import 'package:flutter/material.dart';
import 'package:front_ara/controllers/oauthC.dart';
import 'dart:developer' as developer;
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  oauthC oauht = new oauthC();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        stops: [
                      0.7,
                      0.2
                    ],
                        colors: [
                      Color.fromRGBO(236, 117, 35, 1),
                      Colors.white
                    ])),
                child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/aralog.png',
                            height: height * 0.2,
                          ),
                          SizedBox(height: (0.04 * height)),
                          TextFormField(
                            controller: _correoController,
                            decoration: returnInputDecoration("Correo"),
                          ),
                          SizedBox(height: (0.04 * height)),
                          TextFormField(
                            controller: _contrasenaController,
                            decoration: returnInputDecoration("Contraseña"),
                          ),
                          SizedBox(height: (0.04 * height)),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: const Text('Iniciar sesion'),
                          ),
                          SizedBox(height: (0.04 * height)),
                          ElevatedButton(
                            onPressed: () {
                              _signInWithGoogle();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/googlelog.png',
                                  width: 24,
                                  height: 24,
                                ),
                                const Text("Iniciar sesión con Google")
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () => {logout()},
                              icon: Icon(Icons.abc))
                        ])))));
  }

  // Navigator.pushNamed(context, '/home');

  _signInWithGoogle() async {
    try {
      bool n = await oauht.siging();

      if (n) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (error) {
      // Error durante el inicio de sesión con Google
      developer.log('Error al iniciar sesión con Google: $error');
    }
  }

  logout() async {
    await oauht.logout();
  }

  InputDecoration returnInputDecoration(String data) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Color del borde
      ),
      labelText: data,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
    );
  }
}
