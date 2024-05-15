import 'dart:async';
import 'dart:developer' as developer;
import 'package:front_ara/entitys/person.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:front_ara/controllers/personaC.dart';
import 'package:google_sign_in/google_sign_in.dart';

class oauthC {
  personaC personasC = personaC();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  //Metodo para deslogear al usuario
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    try {
      _googleSignIn.disconnect();
      if (_googleSignIn.currentUser != null) {
        _googleSignIn.disconnect();
        developer.log(prefs.getString('token').toString());
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  //Metodo para iniciar sesion con google y guardar token
  Future<String> siging() async {
    final prefs = await SharedPreferences.getInstance();
    developer.log(prefs.getString('token').toString());
    if (await prefs.getString('token') != null) {
      return '3';
    }

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        developer.log('Nombre: ${googleUser.id}');
        developer.log('Email: ${googleUser.email}');
        String s = await personasC.login(googleUser);
        developer.log(googleUser.id);
        if (s == '1') {
          return '1';
        }
        if (s == '2') {
          _googleSignIn.disconnect();
          return '2';
        }
        return s.toString();
      } else {
        developer.log('Inicio de sesión con Google cancelado.');
        return '3';
      }
    } catch (error) {
      developer.log('Error al iniciar sesión con Google: $error');

      return '3';
    }
  }

  //Registro de usuario por medio de google
  Future<String> Register() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        var name = googleUser.displayName?.split(' ');
        Personas p = Personas(
            cedula: ' ',
            primerNombre: name![0],
            segundoNombre: name[1],
            primerApellido: name[2],
            segundoApellido: name[3],
            correo: googleUser.email,
            contrasena: '',
            usuario: '');
        p.identification = googleUser.id;

        return await personasC.registerG(p);
      } else {
        developer.log('Inicio de sesión con Google cancelado.');
        return '3';
      }
    } catch (error) {
      developer.log('Error al iniciar sesión con Google: $error');

      return '3';
    }
  }
}
