import 'package:flutter/material.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:money2/money2.dart';

/**
 * Metodo para productos dentro del carrito de compras se puede mejorar
 */
class ProductWidget extends StatelessWidget {
  Product product;
  bool showButton;
  double height = 0;
  double width = 0;
  ProductWidget({super.key, required this.product, this.showButton = false});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        _buildProductImage(product.img_src),
        SizedBox(
          width: width * 0.04,
        ),
        Container(
            width: width * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  //Metodo para poder visualizar el valor delproducto
                  Money.parseWithCurrency(
                          product.price.toString(), Currency.create('USD', 2))
                      .format('S###,###'),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w200),
                ),
              ],
            ))
      ],
    );
  }

  Widget _buildProductImage(String imageUrl) {
    try {
      return Image.network(
        height: height * 0.135,
        width: width * 0.35,
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
}
