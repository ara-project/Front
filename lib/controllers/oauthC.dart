import 'dart:async';
import 'dart:developer' as developer;

import 'package:front_ara/controllers/personaC.dart';
import 'package:google_sign_in/google_sign_in.dart';

class oauthC {
  personaC personasC = new personaC();
  siging() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

    try {
      // Iniciar sesión con Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Se obtuvo exitosamente el usuario de Google
        // Ahora puedes obtener la información del usuario si lo necesitas
        developer.log('Nombre: ${googleUser.displayName}');
        developer.log('Email: ${googleUser.email}');
        personasC.login(googleUser);
        return googleUser;
        // Aquí puedes pasar al siguiente paso de tu aplicación, como navegar a una nueva pantalla
      } else {
        // El usuario canceló el inicio de sesión
        developer.log('Inicio de sesión con Google cancelado.');
        return null;
      }
    } catch (error) {
      // Error durante el inicio de sesión con Google
      developer.log('Error al iniciar sesión con Google: $error');

      return null;
    }
  }
}
