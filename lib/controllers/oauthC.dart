import 'dart:async';
import 'dart:developer' as developer;
import 'package:front_ara/entitys/person.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:front_ara/controllers/personaC.dart';
import 'package:google_sign_in/google_sign_in.dart';

class oauthC {
  personaC personasC = new personaC();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  logout() async {
    developer.log(_googleSignIn.currentUser.toString());
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    developer.log(prefs.getString('token').toString());

    if (_googleSignIn.currentUser != null) {
      _googleSignIn.disconnect();
      developer.log(prefs.getString('token').toString());
    }
  }

  Future<bool> siging() async {
    final prefs = await SharedPreferences.getInstance();
    developer.log(prefs.getString('token').toString());
    if (await prefs.getString('token') != null) {
      return true;
    }

    try {
      // Iniciar sesión con Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        developer.log('Nombre: ${googleUser.id}');
        developer.log('Email: ${googleUser.email}');
        String s = await personasC.login(googleUser);
        developer.log(s);
        return s != '' ? true : false;
      } else {
        developer.log('Inicio de sesión con Google cancelado.');
        return false;
      }
    } catch (error) {
      developer.log('Error al iniciar sesión con Google: $error');

      return false;
    }
  }

  Future<String> Register() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        var name = googleUser.displayName?.split('');
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
