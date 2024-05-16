import 'package:flutter/material.dart';

class CustomFormDialog extends StatelessWidget {
  const CustomFormDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Formulario'),
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo electrónico'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción al enviar el formulario
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
