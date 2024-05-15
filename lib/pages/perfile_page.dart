import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:front_ara/entitys/person.dart';
import 'package:front_ara/widgets/textInput.dart';

class Perfil extends StatelessWidget {
   Perfil({super.key});
=======
import 'package:front_ara/entitys/person.dart';

class Perfil extends StatelessWidget {
  Personas usuario;
  Perfil({super.key, required this.usuario});
>>>>>>> 1b87bd6a86c30ef59a295bf2068aa93bf2a727d0

  TextEditingController nombreController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
     nombreController.text='Daniel';
     Personas persona = Personas(cedula: "1066", 
              primerNombre: "Daniel", 
              segundoNombre: "David", 
              primerApellido: "Padilla", 
              segundoApellido: "Rodriguez", 
              correo: "ddavidpadilla@unicesar.edu.co", 
              contrasena: "Dan", 
              usuario: "Rosé");
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil de Usuario'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text('Usuario'),
                SizedBox(height: 20),
                Icon(
                  Icons.supervised_user_circle_rounded,
                  size: 100,
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text('Rosé'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Cédula"),
                              TextInputWidget(persona: persona)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nombre"),
                              Text("Daniel"),
                              Text("Apellido"),
                              Text("Padilla Rodriguez")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Correo Electrónico"),
                              Text("ddavidpadilla@unicesar.edu.co")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
=======
    return Scaffold(
      appBar: AppBar(
          title: const Text("Información del perfil"),
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
>>>>>>> 1b87bd6a86c30ef59a295bf2068aa93bf2a727d0
    );
  }
}
