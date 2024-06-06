import 'package:flutter/material.dart';
import 'package:front_ara/pages/home_page.dart';
import 'package:front_ara/pages/login_page.dart';
import 'package:front_ara/pages/main_page.dart';
import 'package:front_ara/pages/register_page.dart';
import 'package:front_ara/pages/reset_password.dart';
import 'package:front_ara/pages/payment_method.dart';
import 'package:front_ara/pages/shipping_adress.dart';
import 'package:front_ara/pages/confirm_order.dart';
import 'package:front_ara/pages/pay_succesfull.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/home': (context) => const home(),
        '/resetPassword': (context) => const Reset(),
        '/selectPayment': (context) => const PaymentMethod(),
        '/shippingAdress': (context) => const ShippingAdress(),
        '/resumeShipping': (context) => const OrderConfirm(),
        '/successPay': (context) => const PaySuccesfull()
      },
      title: 'Ara app',
      home: const Scaffold(
        body: home(),
      ),
    );
  }
}
