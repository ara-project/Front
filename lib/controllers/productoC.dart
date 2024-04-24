import 'package:front_ara/entitys/product.dart';
import 'package:http/http.dart' as http;
import 'package:front_ara/config.dart';
import 'dart:convert';

class ProductC {
  late List<Product> suggestionList = [];

  Future<List<Product>> dataProducts() async {
    var url = Uri.parse('${MyConfig.uri}/Product');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Product.fromJson(json)).toList();
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error de conexión: $e');
      return [];
    }
  }

  Future<List<Product>> fetchDatassuggestion(String p) async {
    var url = Uri.parse('${MyConfig.uri}/Product/${p.toString()}');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Product.fromJson(json)).toList();
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error de conexión: $e');
      return [];
    }
  }

  Future<Product> fetchproductbyid(String p) async {
    var url = Uri.parse('${MyConfig.uri}/Product/find/${p.toString()}');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        return Product.fromJson(jsonData);
      } else {
        print('Error: ${response.statusCode}');
        return Product(
          idProduct: 0,
          name: '',
          quantityAvalaible: 0,
          category: 0,
          price: 0,
          describe: '',
          brand: 0,
          img_src: '',
          discount: 0.0,
          content: '',
          state: 0,
          packaging: 0,
        );
      }
    } catch (e) {
      print('Error de conexión: $e');
      return Product(
        idProduct: 0,
        name: '',
        quantityAvalaible: 0,
        category: 0,
        price: 0,
        describe: '',
        brand: 0,
        img_src: '',
        discount: 0.0,
        content: '',
        state: 0,
        packaging: 0,
      );
    }
  }
}
