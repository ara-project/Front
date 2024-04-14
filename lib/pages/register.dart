import 'package:flutter/material.dart';
import 'package:front_ara/entitys/person.dart';

class Register extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(236, 117, 35, 1), // Color del fondo
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/aralog.png',
                height: 40,
              ),
              TextFormField(
                controller: _cedulaController,
                decoration: InputDecoration(labelText: 'Cédula'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _primerNombreController,
                decoration: InputDecoration(labelText: 'Primer Nombre'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _segundoNombreController,
                decoration: InputDecoration(labelText: 'Segundo Nombre'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _primerApellidoController,
                decoration: InputDecoration(labelText: 'Primer Apellido'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _segundoApellidoController,
                decoration: InputDecoration(labelText: 'Segundo Apellido'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _correoController,
                decoration: InputDecoration(labelText: 'Correo'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _contrasenaController,
                decoration: InputDecoration(labelText: 'Contrasena'),
                obscureText: true,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _usuarioController,
                decoration: InputDecoration(labelText: 'Usuario'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  _register();
                },
                child: Text('Registrarse'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  _signInWithGoogle();
                },
                child: Text('Iniciar sesión con Google'),
              ),
            ],
          ),
        ));
  }

  void _register() {
    // Recuperar valores de los campos
    String cedula = _cedulaController.text;
    String primerNombre = _primerNombreController.text;
    String segundoNombre = _segundoNombreController.text;
    String primerApellido = _primerApellidoController.text;
    String segundoApellido = _segundoApellidoController.text;
    String correo = _correoController.text;
    String contrasena = _contrasenaController.text;
    String usuario = _usuarioController.text;

    // Crear una nueva instancia de Persona
    Personas nuevaPersona = Personas(
      cedula: cedula,
      primerNombre: primerNombre,
      segundoNombre: segundoNombre,
      primerApellido: primerApellido,
      segundoApellido: segundoApellido,
      correo: correo,
      contrasena: contrasena,
      usuario: usuario,
    );

    // Aquí puedes hacer cualquier cosa con la nueva persona, como enviarla a un servidor
    // En este ejemplo, simplemente imprimimos los valores
    print('Cédula: ${nuevaPersona.cedula}');
    print('Primer Nombre: ${nuevaPersona.primerNombre}');
    print('Segundo Nombre: ${nuevaPersona.segundoNombre}');
    print('Primer Apellido: ${nuevaPersona.primerApellido}');
    print('Segundo Apellido: ${nuevaPersona.segundoApellido}');
    print('Correo: ${nuevaPersona.correo}');
    print('Contrasena: ${nuevaPersona.contrasena}');
    print('Usuario: ${nuevaPersona.usuario}');
  }

  void _signInWithGoogle() {
    // Implementa la lógica para iniciar sesión con Google aquí
    print('Iniciar sesión con Google');
  }
}
