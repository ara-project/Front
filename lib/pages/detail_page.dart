import 'package:flutter/material.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:money2/money2.dart';

class Detailproduct extends StatelessWidget {
  Product product;
  Function(Product) addProduct;

  Detailproduct({super.key, required this.product, required this.addProduct});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(236, 117, 35, 1),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    height: height * 0.4,
                    child: _buildProductImage(product.img_src),
                  ),
                  Column(
                    children: [
                      Text(
                        product.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        Money.parseWithCurrency(product.price.toString(),
                                Currency.create('USD', 2))
                            .format('S###,###'),
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    product.describe,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Text(
                    product.content,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => {addProduct(product)},
                          child: Text(
                            "Agregar al Carrito",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return Color.fromRGBO(236, 117, 35, 1);
                                },
                              ),
                              fixedSize:
                                  MaterialStateProperty.all(Size(width, 50))))
                    ],
                  )
                ],
              )),
        ));
  }

  Widget _buildProductImage(String imageUrl) {
    try {
      return Image.network(
        imageUrl,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    } catch (e) {
      print('Error al cargar la imagen: $e');
      return SizedBox();
    }
  }
}
