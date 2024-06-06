import 'package:flutter/material.dart';
import 'package:front_ara/controllers/personaC.dart';
import 'package:front_ara/entitys/person.dart';
import 'package:front_ara/pages/home_page.dart';
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
        child: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () async {
                await closeSesion();
                Navigator.pushNamed(context, '/login').then((value) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                });
              },
              child: Row(children: [
                Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
                Text(
                  "Cerrar sesión",
                  style: _styleText(),
                ),
              ])),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () async {
              await infoUser(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
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
          SizedBox(
            height: 30,
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
                ),
                SizedBox(width: 8),
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
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 30,
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
    return const TextStyle(
        fontSize: 20, fontStyle: FontStyle.normal, color: Colors.black);
  }
}
