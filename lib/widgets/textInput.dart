import 'package:flutter/material.dart';
import 'package:front_ara/entitys/person.dart';

class TextInputWidget extends StatefulWidget {
  final Personas persona;

  const TextInputWidget({super.key, required this.persona});

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  // Controlador para manejar el valor del input
  final TextEditingController _controller=TextEditingController();

  @override
  void initState(){
    super.initState();
    _controller.text=widget.persona.primerNombre;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se elimina del árbol de widgets
    _controller.dispose();
    super.dispose();
  }
}