import 'package:front_ara/entitys/order.dart';
import 'package:http/http.dart' as http;
import 'package:front_ara/config.dart';
import 'dart:convert';
import 'dart:developer' as developer;

class OrderC {
  //Crear Orden
  Future<String> createOrder(Order request) async {
    var url = Uri.parse('${MyConfig.uri}/ordersdetails/save');
    var body = jsonEncode(
        {"totalProducts": request.listProduct, "token": request.token});
    try {
      var response = await http.post(
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
      return e.runtimeType.toString();
    }
  }
}
