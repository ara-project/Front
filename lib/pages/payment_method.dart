import 'package:flutter/material.dart';
import 'package:front_ara/controllers/payment_c.dart';
import 'package:front_ara/entitys/payment.dart';
import 'package:front_ara/widgets/form_payment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _accountHolder = TextEditingController();
  final TextEditingController _cvc = TextEditingController();
  final TextEditingController _identification = TextEditingController();
  final TextEditingController _paymentInstallments = TextEditingController();
  var total = 0.0;
  PaymentC payment = PaymentC();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size sise = MediaQuery.of(context).size;
    var subtotal = ModalRoute.of(context)?.settings.arguments.toString() ?? "";
    total = (double.tryParse(subtotal) ?? 0) + 5000;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Seleccionar metodo de compra'),
          leading: const BackButton(),
          backgroundColor: const Color(0xFFDB3022),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Container(
                      width: sise.width,
                      height: 35,
                      decoration: BoxDecoration(
                          border: _type == 1
                              ? Border.all(width: 1, color: Color(0xFFDB3022))
                              : Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Color(0xFFDB3022),
                                  ),
                                  Text(
                                    "Nequi",
                                    style: _type == 1
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                  ),
                                ],
                              ),
                              Image.asset(
                                "assets/nequi_logo.png",
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: sise.width,
                      height: 35,
                      decoration: BoxDecoration(
                          border: _type == 2
                              ? Border.all(width: 1, color: Color(0xFFDB3022))
                              : Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Color(0xFFDB3022),
                                  ),
                                  Text(
                                    "Tarjeta de credito",
                                    style: _type == 2
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Image.asset(
                                "assets/Visa_Inc._logo.png",
                                width: 30,
                              ),
                              SizedBox(width: 8),
                              Image.asset(
                                "assets/MasterCard_Logo.png",
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: sise.width,
                      height: 35,
                      decoration: BoxDecoration(
                          border: _type == 3
                              ? Border.all(width: 1, color: Color(0xFFDB3022))
                              : Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Color(0xFFDB3022),
                                  ),
                                  Text(
                                    "Bancolombia A la mano",
                                    style: _type == 3
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                  ),
                                ],
                              ),
                              Image.asset(
                                "assets/LogoBancolombia.png",
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
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
                    TextButton(
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return toogleFormPay(_type, subtotal);
                          },
                        )
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFDB3022),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Define la forma del borde
                        ),
                      ),
                      child: Text(
                        "Continuar pago",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  CustomFormDialog toogleFormPay(int value, subtotal) {
    switch (value) {
      case 1:
        return CustomFormDialog(
            titleBar: "Nequi",
            firstInput: "Numero de cuenta",
            secondInput: "Nombre del titular",
            thirdInput: "Codigo dinamico",
            fourthInput: "Cedula",
            fifthInput: "Otro campo requerido",
            subtotal: subtotal,
            firstController: _accountNumber,
            secondController: _accountHolder,
            thirdController: _cvc,
            fourthController: _identification,
            fifthController: _paymentInstallments,
            saveFunction: createPayment);
      case 2:
        return CustomFormDialog(
            titleBar: "Tarjeta de credito",
            firstInput: "Numero de cuenta",
            secondInput: "Nombre del titular",
            thirdInput: "Fecha de vencimiento",
            fourthInput: "CVV",
            fifthInput: "Numero de cuotas",
            subtotal: subtotal,
            firstController: _accountNumber,
            secondController: _accountHolder,
            thirdController: _cvc,
            fourthController: _identification,
            fifthController: _paymentInstallments,
            saveFunction: createPayment);
      case 3:
        return CustomFormDialog(
            titleBar: "Ahorro a la mano",
            firstInput: "Numero de cuenta",
            secondInput: "Nombre del titular",
            thirdInput: "Codigo dinamico",
            fourthInput: "Cedula",
            fifthInput: "Otro campo requerido",
            subtotal: subtotal,
            firstController: _accountNumber,
            secondController: _accountHolder,
            thirdController: _cvc,
            fourthController: _identification,
            fifthController: _paymentInstallments,
            saveFunction: createPayment);
    }
    return CustomFormDialog(
        titleBar: "Default",
        firstInput: "Default",
        secondInput: "Default",
        thirdInput: "Default",
        fourthInput: "Default",
        fifthInput: "Default",
        subtotal: subtotal,
        firstController: _accountNumber,
        secondController: _accountHolder,
        thirdController: _cvc,
        fourthController: _identification,
        fifthController: _paymentInstallments,
        saveFunction: createPayment);
  }

  Future<bool> createPayment() async {
    final prefs = await SharedPreferences.getInstance();
    String idOrder = prefs.getString('idOrder')!;
    String token = prefs.getString('token')!;
    Payment pay = Payment(
        token: token,
        idOrder: idOrder,
        cardNumber: _accountNumber.text,
        accountHolder: _accountHolder.text,
        cardExpiration: _identification.text,
        securityCode: _cvc.text,
        paymentInstallments: _paymentInstallments.text.isNotEmpty
            ? int.parse(_paymentInstallments.text)
            : 0,
        idMethod: _type,
        totalPaid: total);
    var response = await payment.createPayment(pay);
    prefs.setString('idPayment', response);
    if (response != '') {
      print(prefs.getString('idPayment')!);
      return true;
    } else {
      return false;
    }
  }
}
