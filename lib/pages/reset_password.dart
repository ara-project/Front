import 'package:flutter/material.dart';
import 'package:front_ara/controllers/personaC.dart';
import 'package:front_ara/entitys/password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<Reset> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();
  personaC resetPasswordC = personaC();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(236, 117, 35, 1),
          title: const Text(
            "Cambiar contraseña",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    stops: [0.7, 0.2],
                    colors: [Color.fromRGBO(236, 117, 35, 1), Colors.white])),
            child: Padding(
                padding: EdgeInsets.all(0.04 * height),
                child: Form(
                    key: _formKey,
                    child: ListView(children: [
                      Image.asset(
                        'assets/aralog.png',
                        height: 0.15 * height,
                      ),
                      SizedBox(height: (0.02 * height)),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: returnInputDecoration("Contraseña actual"),
                        validator: (value) {
                          if (value == null) {
                            return "El campo esta vacio";
                          }
                        },
                      ),
                      SizedBox(height: (0.02 * height)),
                      TextFormField(
                        controller: _newPasswordController,
                        obscureText: _obscureText,
                        decoration: returnInputDecoration("Nueva Contraseña"),
                        validator: (value) {
                          if (value == null) {
                            return "El campo esta vacio";
                          }
                        },
                      ),
                      SizedBox(height: (0.02 * height)),
                      TextFormField(
                        controller: _confirmNewPasswordController,
                        obscureText: _obscureText,
                        decoration:
                            returnInputDecoration("Confirmar Nueva Contraseña"),
                        validator: (value) {
                          if (value == null) {
                            return "El campo esta vacio";
                          }
                        },
                      ),
                      SizedBox(height: (0.02 * height)),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _resetPassword();
                          } else {}
                        },
                        child: const Text('Cambiar contraseña'),
                      ),
                    ])))),
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
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ));
  }

  void _resetPassword() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    Resetpassword newPassword = Resetpassword(
        token: token,
        password: _passwordController.text,
        newPassword: _newPasswordController.text,
        confirmNewPassword: _confirmNewPasswordController.text);
    var response = await resetPasswordC.resetPassword(newPassword);
    showResponseDialog(response);
  }

  void showResponseDialog(String textResponse) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(textResponse),
          contentTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text(
                "Cerrar",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
