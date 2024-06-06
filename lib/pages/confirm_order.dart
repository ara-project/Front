import 'package:flutter/material.dart';

class OrderConfirm extends StatelessWidget {
  const OrderConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    var subtotal = ModalRoute.of(context)?.settings.arguments.toString() ?? "";
    var total = (double.tryParse(subtotal) ?? 0) + 5000;
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
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vamos a ver que tal',
                            style: TextStyle(fontSize: 16),
                          ),
                          button()
                        ],
                      ),
                      Text(
                        "Calle 23 #6-18",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Barrio Cañaguate",
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
                    button()
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
                                spreadRadius: 2)
                          ]),
                      child: Image.asset("MasterCard_Logo.png"),
                    ),
                    SizedBox(width: 20),
                    Text('***** *** *** 2343')
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
                                spreadRadius: 2)
                          ]),
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
                                spreadRadius: 2)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Domicilio',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFDB3022)),
                          ),
                          Text('20-30 min')
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
                          color: Colors.grey),
                    ),
                    Text(
                      subtotal,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )
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
                          color: Colors.grey),
                    ),
                    Text(
                      "5000",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )
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
                          color: Colors.grey),
                    ),
                    Text(
                      total.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFDB3022)),
                    )
                  ],
                ),
                SizedBox(height: 70),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/resumeShipping');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDB3022),
                      minimumSize: Size(double.infinity, 50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Confirmar Compra",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextButton button() {
  return TextButton(
      onPressed: () {},
      child: Text(
        'Changue',
        style: TextStyle(
            fontSize: 17,
            color: Color(0xFFDB3022),
            fontWeight: FontWeight.bold),
      ));
}
