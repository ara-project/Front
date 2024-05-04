import 'package:front_ara/entitys/person.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:front_ara/config.dart';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';

class personaC {
  //Metodo para hacer login de una usuario usando google Account
  Future<String> login(GoogleSignInAccount g) async {
    var url = Uri.parse('${MyConfig.uri}/Oauth/login');

    try {
      var response = await http.post(url, body: g.id);

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        developer.log(jsonData['token'].toString());
        String token = jsonData['token'];
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

  //Metodo para logear a un usuario con username y password
  Future<String> loginN(String username, String password) async {
    var url = Uri.parse('${MyConfig.uri}/auth/authenticate');
    var body = jsonEncode({"username": username, "password": password});
    try {
      var response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        developer.log(jsonData['token'].toString());

        String token = jsonData['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        return '1';
      } else {
        developer.log('Error: ${response.body}');
        return '';
      }
    } catch (e) {
      developer.log('Error de conexión aqui: $e');
      return '';
    }
  }

  //Registro de usuario con google
  Future<String> registerG(Personas p) async {
    var url = Uri.parse('${MyConfig.uri}/Oauth/register');
    var body = jsonEncode({
      "identification": p.identification,
      "name": p.primerNombre,
      "secondName": p.segundoNombre,
      "lastname": p.primerApellido,
      "secondLastname": p.segundoApellido,
      "email": p.correo,
      "role": "CUSTOMER",
      "enabled": true,
    });
    developer.log('todo bien: ${body.toString()}');

    try {
      var response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        developer.log('todo bien: ${jsonData}');

        return '1';
      } else {
        if (response.statusCode == 450) {
          developer.log('ya existe: ${response.statusCode}');

          return '2';
        }
        developer.log('Error: ${response.statusCode}');
        return '3';
      }
    } catch (e) {
      developer.log('Error de conexión aqui: $e');
      return '3';
    }
  }

  //Registro de usuario sin google
  Future<String> register(Personas p) async {
    var url = Uri.parse('${MyConfig.uri}/personas/register');
    var body = jsonEncode({
      "dni": p.cedula,
      "identification": p.identification,
      "name": p.primerNombre,
      "secondName": p.segundoNombre,
      "lastname": p.primerApellido,
      "secondLastname": p.segundoApellido,
      "email": p.correo,
      "role": "CUSTOMER",
      "password": p.contrasena,
      "enabled": true,
    });
    developer.log('todo bien: ${body.toString()}');

    try {
      var response = await http.post(
        url,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        developer.log('todo bien: ${jsonData.toString()}');

        return '1';
      } else {
        if (response.statusCode == 450) {
          developer.log('ya existe: ${response.statusCode}');

          return '2';
        }
        developer.log('Error: ${response.statusCode}');
        return '3';
      }
    } catch (e) {
      developer.log('Error de conexión aqui: $e');
      return '3';
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
