import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:money2/money2.dart';

class Detailproduct extends StatelessWidget {
  Product product;
  bool showAdd;
  Function(Product) addProduct;

  Detailproduct(
      {super.key,
      required this.product,
      required this.addProduct,
      this.showAdd = true});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(236, 117, 35, 1),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Imagen del producto
                  Container(
                    width: width,
                    height: height * 0.4,
                    child: _buildProductImage(product.img_src),
                  ),
                  Column(
                    children: [
                      //Nombre del producto
                      Text(
                        product.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        //Visualizar el precio del producto
                        Money.parseWithCurrency(product.price.toString(),
                                Currency.create('USD', 2))
                            .format('S###,###'),
                        style: const TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.describe,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.content,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 20,
                  ),
                  Column(
                    children: showAdd
                        ? [
                            //Boton agregar al carrito
                            ElevatedButton(
                              onPressed: () => {addProduct(product)},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      return const Color.fromRGBO(
                                          236, 117, 35, 1);
                                    },
                                  ),
                                  fixedSize: MaterialStateProperty.all(
                                      Size(width, 50))),
                              child: const Text(
                                "Agregar al Carrito",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )
                          ]
                        : [],
                  )
                ],
              )),
        ));
  }

//Cargar la imagen del producto
  Widget _buildProductImage(String imageUrl) {
    try {
      return Image.network(
        imageUrl,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } catch (e) {
      return const SizedBox();
    }
  }
}
