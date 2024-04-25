import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:front_ara/config.dart';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';

class personaC {
  Future<String> login(GoogleSignInAccount g) async {
    var url = Uri.parse('${MyConfig.uri}/Oauth/login');

    try {
      var response = await http.post(url, body: g.id);

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        developer.log(jsonData['token'].toString());

        String token = jsonData['token'];

        // 1. Store token in SharedPreferences (**NOT RECOMMENDED**):
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        return token;
      } else {
        developer.log('Error: ${response.statusCode}');
        return '';
      }
    } catch (e) {
      developer.log('Error de conexión aqui: $e');
      return '';
    }
  }
}


/***
 * Personas(
          cedula: '',
          primerNombre: '',
          segundoNombre: '',
          primerApellido: '',
          segundoApellido: '',
          correo: '',
          contrasena: '',
          usuario: '');
 */
