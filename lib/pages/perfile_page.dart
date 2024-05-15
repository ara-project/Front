import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:front_ara/entitys/person.dart';
import 'package:front_ara/widgets/textInput.dart';

class Perfil extends StatelessWidget {
   Perfil({super.key});

  TextEditingController nombreController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
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
    );
  }
}