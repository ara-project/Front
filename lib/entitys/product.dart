import 'dart:convert';

class Product {
  int idProduct = 0;
  String name = '';
  int quantityAvalaible = 0;
  int category = 0;
  double price = 0;
  String describe = '';
  int brand = 0;
  String img_src = '';
  String content = '';
  int packaging = 0;
  int state = 0;
  double discount = 0.0;

  Product(
      {required this.idProduct,
      required this.name,
      required this.quantityAvalaible,
      required this.category,
      required this.price,
      required this.describe,
      required this.brand,
      required this.img_src,
      required this.discount,
      required this.content,
      required this.state,
      required this.packaging});

  factory Product.fromJson(Map<String, dynamic> json) {
    var encoded = latin1.encode(json['describe'].toString());
    var decodedDescribe = utf8.decode(encoded);
    encoded = latin1.encode(json['name'].toString());
    var decodedName = utf8.decode(encoded);
    return Product(
      discount: json['discount'] ?? 0,
      state: json['state'] ?? 0,
      idProduct: json['idProduct'] ?? 0,
      name: decodedName,
      quantityAvalaible: json['quantityAvailable'] ?? 0,
      category: json['category'] ?? 0,
      price: json['price'] ?? 0,
      describe: decodedDescribe,
      brand: json['brand'] ?? 0,
      img_src: json['img_src'] ?? '',
      packaging: json['packaging'] ?? 0,
      content: json['content'] ?? '',
    );
  }
}
