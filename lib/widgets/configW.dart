import 'package:flutter/material.dart';
import 'package:front_ara/entitys/person.dart';
import 'package:front_ara/pages/perfile_page.dart';

//Widget para la configuracion del usuario
class configW extends StatelessWidget {
  Function closeSesion;
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
              Navigator.pushNamed(context, '/login');
            },
            child: const Text("Cerrar sesión"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Perfil(
                      usuario: Personas(
                          cedula: '23123',
                          primerNombre: 'Luis',
                          segundoNombre: 'Alejandro',
                          primerApellido: 'Carretero',
                          segundoApellido: 'Ballesteros',
                          correo: 'alejocarreteroballesteros@gmail.com',
                          contrasena: 'na',
                          usuario: 'chandro')),
                ),
              );
            },
            child: const Text("Información Usuario"),
          )
        ],
      ),
    );
  }
}
