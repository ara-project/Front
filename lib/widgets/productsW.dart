import 'package:flutter/material.dart';
import 'package:front_ara/entitys/product.dart';

class productW extends StatelessWidget {
  List<Product> products;
  productW({super.key, required this.products});
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
            child: ListTile(
              leading: Image.network(products[index].img_src),
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(products[index].name),
              ),
              subtitle: Text(products[index].describe.toString()),
            ),
          );
        },
      ),
    );
  }
}
