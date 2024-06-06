import 'package:flutter/material.dart';
import 'package:front_ara/controllers/oauthC.dart';
import 'package:front_ara/controllers/personaC.dart';
import 'package:front_ara/entitys/person.dart';
import 'dart:developer' as developer;

import 'package:front_ara/services/personasS.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  oauthC oauthc = oauthC();
  PersonasS personaS = PersonasS();
  final _formKey = GlobalKey<FormState>();

//Todos los campos
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _primerNombreController = TextEditingController();
  final TextEditingController _segundoNombreController =
      TextEditingController();
  final TextEditingController _primerApellidoController =
      TextEditingController();
  final TextEditingController _segundoApellidoController =
      TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  personaC personac = personaC();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: height,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(236, 117, 35, 1), // Color de fondo
          ),
          child: Padding(
            padding: EdgeInsets.all(0.04 * height),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Image.asset(
                    'assets/aralog.png',
                    height: 0.15 * height,
                  ),
                  SizedBox(height: (0.02 * height)),
                  TextFormField(
                    controller: _cedulaController,
                    keyboardType: TextInputType.number,
                    decoration: returnInputDecoration("Cédula"),
                    validator: (value) {
                      if (value != null) {
                        return personaS.validateCedula(value);
                      } else {
                        return "El campo esta vacio";
                      }
                    },
                  ),
                  SizedBox(height: (0.02 * height)),
                  TextFormField(
                    controller: _primerNombreController,
                    decoration: returnInputDecoration("Nombres"),
                    validator: (value) {
                      if (value != null) {
                        return personaS.validateName(value);
                      } else {
                        return "El campo esta vacio";
                      }
                    },
                  ),
                  SizedBox(height: (0.02 * height)),
                  TextFormField(
                    controller: _primerApellidoController,
                    decoration: returnInputDecoration("Apellidos"),
                    validator: (value) {
                      if (value != null) {
                        return personaS.validateName(value);
                      } else {
                        return "El campo esta vacio";
                      }
                    },
                  ),
                  SizedBox(height: (0.02 * height)),
                  TextFormField(
                    controller: _correoController,
                    decoration: returnInputDecoration("Correo"),
                    validator: (value) {
                      if (value != null) {
                        return personaS.validateEmail(value);
                      } else {
                        return "El campo esta vacio";
                      }
                    },
                  ),
                  SizedBox(height: (0.02 * height)),
                  TextFormField(
                    controller: _usuarioController,
                    decoration: returnInputDecoration("Usuario"),
                    validator: (value) {
                      if (value != null) {
                        return personaS.validateUser(value);
                      } else {
                        return "El campo esta vacio";
                      }
                    },
                  ),
                  SizedBox(height: (0.02 * height)),
                  TextFormField(
                    controller: _contrasenaController,
                    decoration: returnInputDecoration("Contraseña"),
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value != null) {
                        return personaS.validatePass(value);
                      } else {
                        return "El campo esta vacio";
                      }
                    },
                  ),
                  const Divider(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Radio de borde del botón
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _register();
                      } else {}
                    },
                    child: Text(
                      "Registrarse", // Texto del botón
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Peso de fuente del texto
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                        const SizedBox(height: 5),
                        const Text("Registrate con Google")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    ));
  }

  //Registro de usuarios
  void _register() async {
    // Recuperar valores de los campos
    String cedula = _cedulaController.text;
    String primerNombre = _primerNombreController.text;
    String segundoNombre = _segundoNombreController.text;
    String primerApellido = _primerApellidoController.text;
    String segundoApellido = _segundoApellidoController.text;
    String correo = _correoController.text;
    String contrasena = _contrasenaController.text;
    String usuario = _usuarioController.text;

    Personas nuevaPersona = Personas(
        cedula: cedula,
        primerNombre: primerNombre,
        segundoNombre: segundoNombre,
        primerApellido: primerApellido,
        segundoApellido: segundoApellido,
        correo: correo,
        contrasena: contrasena,
        usuario: usuario,
        urlPhoto: '');
    var s = await personac.register(nuevaPersona);
    switch (s) {
      case '1':
        developer.log('Inicio de sesion exitoso');
        await personac.loginN(usuario, contrasena);
        Navigator.pushNamed(context, '/home');
        break;
      case '2':
        developer.log('Usuario ya existe');
        await personac.loginN(usuario, contrasena);
        Navigator.pushNamed(context, '/home');
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
  }

  //Registro de usuarios con google
  void _signInWithGoogle() async {
    var s = await oauthc.Register();
    switch (s) {
      //Inicio de sesion exitoso
      case '1':
        developer.log('Inicio de sesion exitoso');
        await oauthc.siging();
        Navigator.pushNamed(context, '/home');
        break;
      case '2':
        //Usuario ya existe inciar sesion
        developer.log('Usuario ya existe');
        await oauthc.siging();
        Navigator.pushNamed(context, '/home');
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
                    Navigator.of(context).pop();
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
  }

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
