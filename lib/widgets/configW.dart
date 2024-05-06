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
    return Padding(
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
            child: const Text("Cerrar sesión"),
          ),
          TextButton(
            onPressed: () async {
              await infoUser(context);
            },
            child: const Text("Información Usuario"),
          )
        ],
      ),
    );
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
