import 'package:flutter/material.dart';
import 'package:front_ara/entitys/person.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _errorMessage = '';

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
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(236, 117, 35, 1), // Color de fondo
        ),
        child: Padding(
          padding: EdgeInsets.all(0.04 * height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/aralog.png',
                height: 40,
              ),
              TextFormField(
                controller: _cedulaController,
                decoration: returnInputDecoration("Cédula"),
              ),
              SizedBox(height: (0.04 * height)),
              TextFormField(
                controller: _primerNombreController,
                decoration: returnInputDecoration("Primer nombre"),
              ),
              SizedBox(height: (0.04 * height)),
              TextFormField(
                controller: _segundoNombreController,
                decoration: returnInputDecoration("Segundo nombre"),
              ),
              SizedBox(height: (0.04 * height)),
              TextFormField(
                controller: _primerApellidoController,
                decoration: returnInputDecoration("Primer apellido"),
              ),
              SizedBox(height: (0.04 * height)),
              TextFormField(
                controller: _segundoApellidoController,
                decoration: returnInputDecoration("Segundo apellido"),
              ),
              SizedBox(height: (0.04 * height)),
              TextFormField(
                controller: _correoController,
                decoration: returnInputDecoration("Correo"),
                validator: (value) {
                  _errorMessage =
                      validator(value!) ?? ''; // Update error immediately
                  return _errorMessage; // Return error message for display
                },
              ),
              SizedBox(height: (0.04 * height)),
              TextFormField(
                controller: _usuarioController,
                decoration: returnInputDecoration("Usuario"),
                enableInteractiveSelection: false,
                onChanged: (text) {},
              ),
              SizedBox(height: (0.04 * height)),
              TextFormField(
                controller: _contrasenaController,
                decoration: returnInputDecoration("Contraseña"),
                obscureText: true, // Ocultar el texto de la contraseña
              ),
              const Divider(height: 40),
              ElevatedButton(
                onPressed: () {
                  _register();
                },
                child: const Text('Registrarse'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _signInWithGoogle();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_business_sharp),
                    Text("Iniciar sesión con Google")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
  }

  void _signInWithGoogle() {
    // Implementa la lógica para iniciar sesión con Google aquí
    print('Iniciar sesión con Google');
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

      // Ajusta el espacio interior del campo de entrada
    );
  }

  validator(String? value) {
    return (value != null && value.contains('@'))
        ? 'Do not use the @ char.'
        : null;
  }
}
