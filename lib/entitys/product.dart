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
  Product(
      {required this.idProduct,
      required this.name,
      required this.quantityAvalaible,
      required this.category,
      required this.price,
      required this.describe,
      required this.brand,
      required this.img_src,
      required this.content,
      required this.packaging});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      idProduct: json['idProduct'] ?? 0,
      name: json['name'] ?? '',
      quantityAvalaible: json['quantityAvailable'] ?? 0,
      category: json['category'] ?? 0,
      price: json['price'] ?? 0,
      describe: json['describe'] ?? '',
      brand: json['brand'] ?? 0,
      img_src: json['img_src'] ?? '',
      packaging: json['packaging'] ?? 0,
      content: json['content'] ?? '',
    );
  }
}
