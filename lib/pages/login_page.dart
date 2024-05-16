import 'package:flutter/material.dart';
import 'package:front_ara/controllers/oauthC.dart';
import 'package:front_ara/controllers/personaC.dart';
import 'dart:developer' as developer;

import 'package:front_ara/services/personasS.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PersonasS personas = PersonasS();
  personaC personac = personaC();
  oauthC oauht = new oauthC();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    validtoken();
  }

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
                    child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/aralog.png',
                                height: height * 0.2,
                              ),
                              SizedBox(height: (0.04 * height)),
                              //Caja de texto Usuario
                              TextFormField(
                                controller: _correoController,
                                decoration: returnInputDecoration("Usuario"),
                                validator: (valor) {
                                  if (valor != null) {
                                    return personas.validateUser(valor);
                                  } else {
                                    return "El campo esta vacio";
                                  }
                                },
                              ),
                              SizedBox(height: (0.04 * height)),
                              //Caja de texto contraseña
                              TextFormField(
                                obscureText: _obscureText,
                                controller: _contrasenaController,
                                decoration: returnInputDecoration("Contraseña"),
                                validator: (valor) {
                                  if (valor != null) {
                                    return personas.validatePass(valor);
                                  } else {
                                    return "El campo esta vacio";
                                  }
                                },
                              ),
                              SizedBox(height: (0.04 * height)),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Login();
                                  } else {}
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
                            ]))))));
  }

  //Metodo para ingreasr el usuario;
  Login() async {
    //Validacion de las condiciones del usuario
    var s = await personac.loginN(
        _correoController.text, _contrasenaController.text);
    developer.log(s.toString());
    if (s == '1') {
      Navigator.pushNamed(context, '/home');
    } else {
      //Sino se ingresa se muestra cuadro de texto
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //   title: const Text("Título del diálogo"),
            content: const Text("No se pudo iniciar sesion de forma correcta"),
            contentTextStyle: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
                child: const Text(
                  "Cerrar",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  //Login de usuario con google
  _signInWithGoogle() async {
    try {
      String s = await oauht.siging();

      switch (s) {
        //Inicio de sesion exitoso
        case '1':
          developer.log('Inicio de sesion exitoso');
          Navigator.pushNamed(context, '/home');
          break;
        case '2':
          //Usuario ya existe inciar sesion
          developer.log('Usuario no existe');
          Navigator.pushNamed(context, '/register');
          break;

        case '3':
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: const Text("No se pudo Registrar de forma correcta"),
                contentTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cierra el diálogo
                    },
                    child: const Text(
                      "Cerrar",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          );
          break;

        default:
          break;
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //   title: const Text("Título del diálogo"),
            content: const Text("No se pudo iniciar sesion de forma correcta"),
            contentTextStyle: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
                child: const Text(
                  "Cerrar",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      );
    }
  }

// Metodo validacion de tokens init
  validtoken() async {
    String s = await personac.validToken();

    switch (s) {
      //Inicio de sesion exitoso
      case '1':
        developer.log('Inicio de sesion exitoso');
        Navigator.pushNamed(context, '/home');
        break;
      default:
        break;
    }
  }

//Metodo para decorar los inputs
  InputDecoration returnInputDecoration(String data) {
    return InputDecoration(
      fillColor: Colors.black.withOpacity(0.10),
      filled: true,
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          )),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
            style: BorderStyle.none,
          )),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
            style: BorderStyle.none,
          )),
      hintStyle: const TextStyle(color: Colors.white),
      labelText: data,
      errorStyle: const TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: TextStyle(color: Colors.white),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
      suffixIcon: data == 'Contraseña'
          ? IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
          : null,
    );
  }
}
