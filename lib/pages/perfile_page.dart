import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.supervised_user_circle_rounded,
                    color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cédula"),
                        Text("1233323"),
                        ],
                      ),
                      SizedBox(width: 20,)],
                      ),
                   SizedBox(height: 20),
                 Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.supervised_user_circle_rounded,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(width: 20), // Espacio entre la imagen y el texto
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nombre"),
                              Text("Rosé"),
                              Text("Apellido"),
                              Text("Rodriguez Perez")
                            ],
                      ),
                  ],),
            ],
          ),
        ),    
      );
  }
}