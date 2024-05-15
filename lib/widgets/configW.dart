import 'package:flutter/material.dart';
import 'package:front_ara/controllers/personaC.dart';
import 'package:front_ara/entitys/person.dart';
import 'package:front_ara/pages/main_page.dart';
import 'package:front_ara/pages/perfile_page.dart';

//Widget para la configuracion del usuario
class configW extends StatelessWidget {
  Function closeSesion;
  personaC personac = personaC();

  configW({super.key, required this.closeSesion});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
        heightFactor: height,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              TextButton(
                  onPressed: () async {
                    await closeSesion();
                    Navigator.pushNamed(context, '/login').then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    });
                  },
                  child: const Row(children: [
                    Icon(Icons.logout), // Icono para "Información Usuario"
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Text("Cerrar sesión"),
                  ])),
              TextButton(
                onPressed: () async {
                  await infoUser(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.person), // Icono para "Información Usuario"
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Text("Información Usuario"),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pushNamed(context, '/resetPassword');
                },
                child: const Row(
                  children: [
                    Icon(Icons.lock), // Icono para "Cambiar Contraseña"
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Text("Cambiar Contraseña"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  //Informacion del usuario
  infoUser(context) async {
    Personas s = await personac.infoUser();
    if (s.correo.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Perfil(usuario: s),
        ),
      );
    } else {
      await closeSesion();
    }
  }
}
