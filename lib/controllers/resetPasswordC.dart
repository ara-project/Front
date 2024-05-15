import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:front_ara/entitys/password.dart';
import 'dart:convert';
import 'package:front_ara/config.dart';

class ResetPasswordC {
  Future<String> resetPassword(Resetpassword request) async {
    var url = Uri.parse('${MyConfig.uri}/personas/resetPassword');
    var body = jsonEncode({
      "token": request.token,
      "password": request.password,
      "newPassword": request.newPassword,
      "confirmNewPassword": request.confirmNewPassword
    });
    try {
      var response = await http.put(
        url,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      print(e.toString());
      return e.runtimeType.toString();
    }
  }
}
