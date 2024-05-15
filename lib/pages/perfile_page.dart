import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_ara/entitys/person.dart';

class Perfil extends StatelessWidget {
  Personas usuario;
  Perfil({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Información del perfil"),
          backgroundColor: const Color.fromARGB(255, 238, 32, 17)),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text('Usuario'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.supervised_user_circle_rounded,
                size: 100,
                color: Colors.black,
              ),
            ],
          ),
          Text('Rosé'),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      Text("1066866440"),
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
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Correo Electrónico"),
                      Text("ddavidpadilla@unicesar.edu.co")
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
