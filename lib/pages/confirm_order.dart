import 'package:flutter/material.dart';
import 'package:front_ara/entitys/resume_payment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  late ResumePaiment resumePayment = ResumePaiment(
      name: 'name',
      address: 'address',
      location: 'location',
      cardNumber: 'cardNumber',
      subtotal: 0.0,
      total: 0.0);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is ResumePaiment) {
      resumePayment = args;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmar Compra"),
        centerTitle: true,
        backgroundColor: Color(0xFFDB3022),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Direccion de envio',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            resumePayment.name,
                            style: TextStyle(fontSize: 16),
                          ),
                          button(context, '/shippingAdress'),
                        ],
                      ),
                      Text(
                        resumePayment.address,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        resumePayment.location,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Detalles de pago',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    button(context, '/selectPayment'),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Image.asset("MasterCard_Logo.png"),
                    ),
                    SizedBox(width: 20),
                    Text('***** *** *** 2343'),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  'Detalles de Envio',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "araEnvios.png",
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Domicilio',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDB3022),
                            ),
                          ),
                          Text('20-30 min'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub-Total",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      resumePayment.subtotal.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Costo de envio",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "5000",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total de compra",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      resumePayment.total.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFDB3022),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/successPay');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDB3022),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Confirmar Compra",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button(BuildContext context, String route) {
    return IconButton(
      icon: Icon(Icons.edit, color: Color(0xFFDB3022)),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

TextButton button(context, routeName) {
  return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        'Cambiar',
        style: TextStyle(
            fontSize: 17,
            color: Color(0xFFDB3022),
            fontWeight: FontWeight.bold),
      ));
}
