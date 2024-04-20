import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<String> _scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    serverClientId:
        '521082561398-dp8rgoob5mf0bvhpp40q8gltcjke56eh.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
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
                              Navigator.pushNamed(context, '/perfil');
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
                        ])))));
  }

  _signInWithGoogle() {
    Navigator.pushNamed(context, '/home');

    /*  await _googleSignIn.signIn();
    final bool isAuthorized = await _googleSignIn.requestScopes(_scopes);
    if (isAuthorized) {
      print("hola");
    }*/
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
