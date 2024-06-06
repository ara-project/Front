import 'package:flutter/material.dart';
import 'package:front_ara/services/personasS.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _cedulaController = TextEditingController();

    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _identificationController =
        TextEditingController();
    PersonasS personaS = PersonasS();
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(0.04 * height),
          child: Form(
            child: ListView(
              children: [
                Image.asset(
                  'assets/aralog.png',
                  height: 0.15 * height,
                ),
                SizedBox(height: (0.02 * height)),
                TextFormField(
                  controller: _cedulaController,
                  keyboardType: TextInputType.number,
                  decoration: returnInputDecoration("Cédula"),
                  validator: (value) {
                    if (value != null) {
                      return personaS.validateCedula(value);
                    } else {
                      return "El campo esta vacio";
                    }
                  },
                ),
                SizedBox(height: (0.02 * height)),
                TextFormField(
                  controller: _usernameController,
                  decoration: returnInputDecoration("username"),
                  validator: (value) {
                    if (value != null) {
                      return personaS.validateName(value);
                    } else {
                      return "El campo esta vacio";
                    }
                  },
                ),
                SizedBox(height: (0.02 * height)),
                TextFormField(
                  controller: _identificationController,
                  decoration: returnInputDecoration("Apellidos"),
                  validator: (value) {
                    if (value != null) {
                      return personaS.validateName(value);
                    } else {
                      return "El campo esta vacio";
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration returnInputDecoration(String data) {
    return InputDecoration(
        fillColor: Colors.black.withOpacity(0.10),
        filled: true,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            )),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
              style: BorderStyle.none,
            )),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
              style: BorderStyle.none,
            )),
        hintStyle: const TextStyle(color: Colors.white),
        labelText: data,
        errorStyle: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: Colors.white),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12.0));
  }
}
