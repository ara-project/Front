class Order {
  List<Map<String, dynamic>> listProduct;
  String token;
  Order({required this.listProduct, required this.token});
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        listProduct: json['products'] ?? [], token: json['token'] ?? '');
  }
}
