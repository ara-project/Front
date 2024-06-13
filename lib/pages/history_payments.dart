import 'package:flutter/material.dart';

class history_payment extends StatefulWidget {
  const history_payment({super.key});

  @override
  State<history_payment> createState() => _history_paymentState();
}

class _history_paymentState extends State<history_payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Historia de compras "),
          backgroundColor: const Color.fromRGBO(236, 117, 35, 1),
        ),
        body: SingleChildScrollView(
          child: Container(),
        ));
  }
}
