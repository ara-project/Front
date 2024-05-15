import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_ara/entitys/person.dart';

class Perfil extends StatelessWidget {
  Personas usuario;
  Perfil({super.key, required this.usuario});

  TextEditingController nombreController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Información del perfil",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 238, 32, 17)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              color: const Color.fromARGB(255, 238, 32, 17),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.supervised_user_circle_rounded,
                          size: 100,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Text(usuario.usuario),
                  ],
                ),
              )),
          Center(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Información del usuario',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.blueAccent, background: Paint()),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.credit_card,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Cédula"),
                        Text(usuario.cedula),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nombre"),
                        Text(
                            usuario.primerNombre + ' ' + usuario.segundoNombre),
                        const Text("Apellido"),
                        Text(usuario.primerApellido +
                            ' ' +
                            usuario.segundoApellido)
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Correo Electrónico"),
                        Text(usuario.correo)
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
