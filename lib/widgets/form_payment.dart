import 'package:flutter/material.dart';
import 'package:front_ara/services/personasS.dart';

class CustomFormDialog extends StatelessWidget {
  final titleBar,
      firstInput,
      secondInput,
      thirdInput,
      fourthInput,
      fifthInput,
      subtotal;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final TextEditingController fourthController;
  final TextEditingController fifthController;
  final Future<bool> Function() saveFunction;
  const CustomFormDialog(
      {super.key,
      required this.titleBar,
      required this.firstInput,
      required this.secondInput,
      required this.thirdInput,
      required this.fourthInput,
      required this.fifthInput,
      required this.subtotal,
      required this.firstController,
      required this.secondController,
      required this.thirdController,
      required this.fourthController,
      required this.fifthController,
      required this.saveFunction});
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
                controller: firstController,
                decoration: returnInputDecoration(firstInput),
                validator: (firstController) {
                  if (firstController != null) {
                    return personas.validateUser(firstController);
                  } else {
                    return "El campo esta vacio";
                  }
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: secondController,
                decoration: returnInputDecoration(secondInput),
                validator: (secondController) {
                  if (secondController != null) {
                    return personas.validateUser(secondController);
                  } else {
                    return "El campo esta vacio";
                  }
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: thirdController,
                decoration: returnInputDecoration(thirdInput),
                validator: (thirdController) {
                  if (thirdController != null) {
                    return personas.validateUser(thirdController);
                  } else {
                    return "El campo esta vacio";
                  }
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: fourthController,
                decoration: returnInputDecoration(fourthInput),
                validator: (fourthController) {
                  if (fourthController != null) {
                    return personas.validateUser(fourthController);
                  } else {
                    return "El campo esta vacio";
                  }
                },
              ),
              SizedBox(height: 15),
              if (titleBar != "Nequi" && titleBar != "Ahorro a la mano")
                TextFormField(
                  controller: fifthController,
                  decoration: returnInputDecoration(fifthInput),
                  validator: (fifthController) {
                    if (fifthController != null) {
                      return personas.validateUser(fifthController);
                    } else {
                      return "El campo esta vacio";
                    }
                  },
                ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  bool expresion = await saveFunction();
                  if (expresion) {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/shippingAdress',
                        arguments: subtotal);
                  } else {
                    print("Error al comprar el producto");
                  }
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
