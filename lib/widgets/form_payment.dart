import 'package:flutter/material.dart';
import 'package:front_ara/services/personasS.dart';

class CustomFormDialog extends StatelessWidget {
  final titleBar, firstInput, secondInput, thirdInput, fourthInput, fifthInput;
  const CustomFormDialog(
      {super.key,
      required this.titleBar,
      required this.firstInput,
      required this.secondInput,
      required this.thirdInput,
      required this.fourthInput,
      required this.fifthInput});
  @override
  Widget build(BuildContext context) {
    PersonasS personas = PersonasS();
    return SimpleDialog(
      title: Text(
        "Pagar con $titleBar",
        style: TextStyle(fontSize: 20, color: Color(0xFFDB3022)),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: returnInputDecoration(firstInput),
                validator: (valor) {
                  if (valor != null) {
                    return personas.validateUser(valor);
                  } else {
                    return "El campo esta vacio";
                  }
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: returnInputDecoration(secondInput),
                validator: (valor) {
                  if (valor != null) {
                    return personas.validateUser(valor);
                  } else {
                    return "El campo esta vacio";
                  }
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: returnInputDecoration(thirdInput),
                validator: (valor) {
                  if (valor != null) {
                    return personas.validateUser(valor);
                  } else {
                    return "El campo esta vacio";
                  }
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: returnInputDecoration(fourthInput),
                validator: (valor) {
                  if (valor != null) {
                    return personas.validateUser(valor);
                  } else {
                    return "El campo esta vacio";
                  }
                },
              ),
              SizedBox(height: 15),
              if (titleBar != "Nequi" && titleBar != "Ahorro a la mano")
                TextFormField(
                  decoration: returnInputDecoration(fifthInput),
                  validator: (valor) {
                    if (valor != null) {
                      return personas.validateUser(valor);
                    } else {
                      return "El campo esta vacio";
                    }
                  },
                ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDB3022)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Pagar",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
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
    labelStyle: TextStyle(color: Colors.black),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
  );
}
