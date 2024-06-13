import 'dart:convert';
import 'package:front_ara/config.dart';
import 'package:front_ara/entitys/payment.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentC {
  //Crear pago.
  Future<String> createPayment(Payment request) async {
    var url = Uri.parse('${MyConfig.uri}/Payment/save');
    var body = jsonEncode({
      "token": request.token,
      "idOrder": request.idOrder,
      "cardNumber": request.cardNumber,
      "accountHolder": request.accountHolder,
      "cardExpiration": request.cardExpiration,
      "securityCode": request.securityCode,
      "paymentInstallments": request.paymentInstallments,
      "idMethod": request.idMethod,
      "totalPaid": request.totalPaid
    });
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

  //Completar Pago
  Future<String> completePayOrder() async {
    final prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(
        '${MyConfig.uri}/Payment/Completepay/${prefs.getString('idPayment')!}');
    try {
      var response = await http.put(
        url,
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
