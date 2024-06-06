import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                            ? const Icon(
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
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: SingleChildScrollView(
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
                                Text(
                                  "Cédula",
                                  style: Titulos(),
                                ),
                                Text(
                                  usuario.cedula,
                                  style: subtitulos(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
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
                                Text(
                                  "Nombre",
                                  style: Titulos(),
                                ),
                                Text(
                                  usuario.primerNombre +
                                      ' ' +
                                      usuario.segundoNombre,
                                  style: subtitulos(),
                                ),
                                Text(
                                  "Apellido",
                                  style: Titulos(),
                                ),
                                Text(
                                  usuario.primerApellido +
                                      ' ' +
                                      usuario.segundoApellido,
                                  style: subtitulos(),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
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
                                Text(
                                  "Correo Electrónico",
                                  overflow: TextOverflow.clip,
                                  maxLines: 3,
                                  style: Titulos(),
                                ),
                                Container(
                                    width: 250,
                                    child: Text(
                                      overflow: TextOverflow.clip,
                                      maxLines: 3,
                                      usuario.correo,
                                      style: subtitulos(),
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )))
        ],
      )),
    );
  }

// Metodo de estilo de textos

  TextStyle Titulos() {
    return TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  }

  //Metodo de subtitulos
  TextStyle subtitulos() {
    return TextStyle(
      fontSize: 20,
      fontFamily: 'consolas',
    );
  }

  Widget _buildProductImage(String imageUrl) {
    try {
      return Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 4.0),
          ),
          child: ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ));
    } catch (e) {
      return const SizedBox();
    }
  }
}/*
Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const CircularProgressIndicator();
              }
            },
          )*/