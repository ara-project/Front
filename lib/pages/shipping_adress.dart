import 'package:flutter/material.dart';
import 'package:front_ara/entitys/resume_payment.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _namePerson = TextEditingController();
  final TextEditingController _location = TextEditingController();
  var subtotal;
  @override
  Widget build(BuildContext context) {
    subtotal = ModalRoute.of(context)?.settings.arguments.toString() ?? 0.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar dirección de envío'),
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
              children: [
                SizedBox(height: 40),
                TextFormField(
                  controller: _namePerson,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre completo',
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Dirección',
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _location,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Barrio',
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  // added controller for phone number
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Teléfono',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    var resume = addDataContext();
                    Navigator.pushNamed(context, '/resumeShipping',
                        arguments: resume);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDB3022),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Añadir Dirección",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
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

  ResumePaiment addDataContext() {
    ResumePaiment resume = ResumePaiment(
      name: _namePerson.text,
      address: _address.text,
      location: _location.text,
      cardNumber: "your_card_number_here",
      subtotal: double.parse(subtotal),
      total: double.parse(subtotal) + 5000,
    );
    return resume;
  }
}
