import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front_ara/entitys/product.dart';

class Detailproduct extends StatelessWidget {
  Product product;
  Detailproduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height * 0.4,
                child: _buildProductImage(product.img_src),
              ),
              Row(
                children: [Text(product.name), Text(product.price.toString())],
              )
            ],
          )),
    );
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
