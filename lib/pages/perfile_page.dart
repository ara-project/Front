import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_ara/entitys/person.dart';

class Perfil extends StatelessWidget {
  Personas usuario;
  Perfil({super.key, required this.usuario});
  double width = 0;
  double height = 0;
  TextEditingController nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        usuario.urlPhoto.isEmpty
                            ? Icon(
                                Icons.supervised_user_circle_rounded,
                                size: 100,
                                color: Colors.black,
                              )
                            : _buildProductImage(usuario.urlPhoto),
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

  Widget _buildProductImage(String imageUrl) {
    try {
      return Image.network(
        height: height * 0.135,
        width: width * 0.35,
        imageUrl,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } catch (e) {
      return const SizedBox();
    }
  }
}
