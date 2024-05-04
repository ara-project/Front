import 'package:flutter/material.dart';

//Widget para la configuracion del usuario
class configW extends StatelessWidget {
  Function closeSesion;
  configW({super.key, required this.closeSesion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          TextButton(
            onPressed: () async {
              await closeSesion();
              Navigator.pushNamed(context, '/login');
            },
            child: const Text("Cerrar sesión"),
          )
        ],
      ),
    );
  }
}
