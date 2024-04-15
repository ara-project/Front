import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    stops: [0.7, 0.2],
                    colors: [Color.fromRGBO(236, 117, 35, 1), Colors.white])),
            child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
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
                        onPressed: () {},
                        child: const Text('Registrarse'),
                      ),
                      SizedBox(height: (0.04 * height)),
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
                    ]))));
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
}
