import 'package:flutter/material.dart';
import 'package:front_ara/controllers/oauthC.dart';
import 'package:front_ara/controllers/personaC.dart';
import 'dart:developer' as developer;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  personaC personac = personaC();
  oauthC oauht = new oauthC();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                        canPop: false,
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
                                    return personac.validateUser(valor);
                                  } else {
                                    return "El campo esta vacio";
                                  }
                                },
                              ),
                              SizedBox(height: (0.04 * height)),
                              //Caja de texto contraseña
                              TextFormField(
                                controller: _contrasenaController,
                                decoration: returnInputDecoration("Contraseña"),
                                validator: (valor) {
                                  if (valor != null) {
                                    return personac.validateUser(valor);
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
                                  }
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
      bool n = await oauht.siging();

      if (n) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (error) {
      // Error durante el inicio de sesión con Google
      developer.log('Error al iniciar sesión con Google: $error');
    }
  }

//Metodo para decorar los inputs
  InputDecoration returnInputDecoration(String data) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Color del borde
      ),
      labelText: data,
      errorStyle: const TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
    );
  }
}
