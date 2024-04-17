import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_ara/entitys/product.dart';

class ProductW extends StatelessWidget {
  List<Product> products;
  ProductW({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Tapped on ${products[index].name}');
            },
            child: Row(
              children: [
                _buildProductImage(products[index].img_src),
                SizedBox(
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
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$${products[index].price.toString()}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

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
      print('Error al cargar la imagen: $e');
      return SizedBox();
    }
  }
}
