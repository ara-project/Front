import 'package:flutter/material.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:front_ara/pages/detail_page.dart';
import 'package:front_ara/widgets/ProductWidget.dart';
import 'dart:developer' as developer;
import 'package:money2/money2.dart';

class ShoppingCart extends StatefulWidget {
  final Map<Product, int> cart;
  ShoppingCart({required this.cart});
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  String total = '';
  @override
  void initState() {
    totalM();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontsize = 24.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrito de compras',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(236, 117, 35, 1),
      ),
      body: widget.cart.isEmpty
          ? const Center(
              child: Text('No hay productos en el carrito de compras'),
            )
          : ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                Product product = widget.cart.keys.toList()[index];
                int quantity = widget.cart.values.toList()[index];

                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Ver los productos
                          builder: (context) => Detailproduct(
                            product: product,
                            addProduct: (Product) => {},
                            showAdd: false,
                          ),
                        ),
                      );
                    },
                    child: Container(
                        child: Row(children: [
                      ProductWidget(
                        product: product,
                        showButton: false,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.cart.remove(product);
                            totalM();
                          });
                        },
                        icon: const Icon(Icons.remove_shopping_cart),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            bottom: 20, top: 10),
                        child: Container(
                          width: width * 0.13,
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () => {
                                        setState(() {
                                          widget.cart[product] =
                                              (widget.cart[product] ?? 0) + 1;
                                          totalM();
                                        })
                                      },
                                  icon: const Icon(Icons.add)),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              IconButton(
                                  onPressed: () => {
                                        setState(() {
                                          if (widget.cart[product] == 1) {
                                            widget.cart.remove(product);
                                          } else {
                                            widget.cart[product] =
                                                (widget.cart[product] ?? 0) - 1;
                                          }
                                          totalM();
                                        })
                                      },
                                  icon: const Icon(Icons.remove)),
                            ],
                          ),
                        ),
                      )
                    ])));
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 20, top: 20, end: 20, bottom: 0),
        height: height * 0.25,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Subtotal:",
                    style: TextStyle(
                        fontSize: fontsize, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: fontsize),
                  Text(
                    total,
                    style: TextStyle(fontSize: fontsize),
                  )
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                      fontSize: fontsize, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 30),
                Text(
                  total,
                  style: TextStyle(fontSize: fontsize),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            widget.cart.isEmpty
                ? SizedBox()
                : TextButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/selectPayment')},
                    style: TextButton.styleFrom(
                      alignment: Alignment
                          .bottomCenter, // Align the content within the button
                      minimumSize: Size(300, 0),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Define la forma del borde
                      ),
                    ),
                    child: Text(
                      "Continuar Compra",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontsize,
                          fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  //Calcular el monto total en el carrito de compras
  void totalM() {
    double subtotal = 0;
    widget.cart.keys.toList().forEach((element) {
      subtotal = subtotal + (element.price * (widget.cart[element] ?? 0));
    });
    developer.log(subtotal.toString());
    total =
        Money.parseWithCurrency(subtotal.toString(), Currency.create('USD', 2))
            .format('S###,###');
  }
}
