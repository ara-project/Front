import 'package:flutter/material.dart';

class productW extends StatelessWidget {
  static List categorias = [
    {"categoria": "carnes", "imagen": "carnes.png"},
    {"categoria": "granos", "imagen": "granos.png"},
    {"categoria": "lacteos", "imagen": "lacteos.png"},
    {"categoria": "verduras", "imagen": "verduras.png"},
  ];
  const productW({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: ListView(
            scrollDirection: Axis.vertical, children: categoryBuild()));
  }

  List<Widget> categoryBuild() {
    List<Widget> categoryListBuild = [];

    categorias.forEach((element) {
      categoryListBuild.add(Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            'assets/aralog.png',
            fit: BoxFit.cover,
          ),
          Text(
            "pepe",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ));
    });

    return categoryListBuild;
  }
}
