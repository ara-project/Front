import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:front_ara/pages/detail_page.dart';
import 'dart:developer' as developer;

import 'package:money2/money2.dart';

//Widget que carga todos los productos en una lista de scroll
class ProductsW extends StatelessWidget {
  List<Product> products;
  Function(Product) addProduct;
  ProductsW({Key? key, required this.products, required this.addProduct});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //Ver los productos
                  builder: (context) => Detailproduct(
                    product: products[index],
                    addProduct: addProduct,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                _buildProductImage(products[index].img_src),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          //Metodo convertir el precio
                          Money.parseWithCurrency(
                                  products[index].price.toString(),
                                  Currency.create('USD', 2))
                              .format('S###,###'),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        IconButton(
                            onPressed: () {
                              addProduct(products[index]);
                            },
                            icon: const Icon(Icons.add, color: Colors.blue))
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

//Cargar la imagen
  Widget _buildProductImage(String imageUrl) {
    try {
      return Image.network(
        height: 120,
        width: 100,
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
      return const SizedBox();
    }
  }

/*  String formatPrice(double price) {
    final usdCurrency = Currency.create('USD', 2, symbol: '\$');
    final money = Money.fromNum(price, isoCode: usdCurrency);
    return money.format('S###,###.00');
  }*/
}
