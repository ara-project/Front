import 'package:front_ara/entitys/person.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:front_ara/config.dart';
import 'dart:convert';
import 'dart:developer' as developer;

class personaC {
  Future<Personas> login(GoogleSignInAccount g) async {
    var url = Uri.parse('${MyConfig.uri}/Oauth/login/');

    try {
      var response = await http.post(url,
          body: jsonEncode({
            'sub': g.id,
          }));

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        developer.log(jsonData);
        return Personas(
            cedula: '',
            primerNombre: '',
            segundoNombre: '',
            primerApellido: '',
            segundoApellido: '',
            correo: '',
            contrasena: '',
            usuario: '');
      } else {
        developer.log('Error: ${response.statusCode}');
        return Personas(
            cedula: '',
            primerNombre: '',
            segundoNombre: '',
            primerApellido: '',
            segundoApellido: '',
            correo: '',
            contrasena: '',
            usuario: '');
      }
    } catch (e) {
      developer.log('Error de conexión: $e');
      return Personas(
          cedula: '',
          primerNombre: '',
          segundoNombre: '',
          primerApellido: '',
          segundoApellido: '',
          correo: '',
          contrasena: '',
          usuario: '');
    }
  }
}
