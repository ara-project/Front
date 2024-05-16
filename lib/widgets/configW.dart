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
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                stops: [0.7, 0.2],
                colors: [Color.fromRGBO(236, 117, 35, 1), Colors.white])),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () async {
                    await closeSesion();
                    Navigator.pushNamed(context, '/login').then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    });
                  },
                  child: Row(children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ), // Icono para "Información Usuario"
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Text(
                      "Cerrar sesión",
                      style: _styleText(),
                    ),
                  ])),
              TextButton(
                onPressed: () async {
                  await infoUser(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                    ), // Icono para "Información Usuario"
                    SizedBox(width: 8),
                    Container(
                      width: 120,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        "Información Usuario",
                        style: _styleText(),
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pushNamed(context, '/resetPassword');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.black,
                    ), // Icono para "Cambiar Contraseña"
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Container(
                      width: 120,
                      child: Text(
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        "Cambiar Contraseña",
                        style: _styleText(),
                      ),
                    )
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

  //Style text
  TextStyle _styleText() {
    return TextStyle(
        fontSize: 25,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }
}
