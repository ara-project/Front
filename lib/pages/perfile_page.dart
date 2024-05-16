import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_ara/entitys/person.dart';
import 'package:front_ara/widgets/perfilW.dart';

class Perfil extends StatelessWidget {
  Personas usuario;
  Perfil({super.key, required this.usuario});

  TextEditingController nombreController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ),
        body: Stack(
          children: [
            Flexible(
              child: Container(
                height: 250,
                width: double.infinity,
                color: Colors.red,
              ),
            ),
            Container(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PerfilW(),
                ],
              ),
            ),
          ),

          ]
        ),
    );
  }
}
