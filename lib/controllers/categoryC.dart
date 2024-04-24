import 'dart:convert';
import 'package:front_ara/entitys/category.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:http/http.dart' as http;
import 'package:front_ara/config.dart';

class CategoryC {
  Future<List<Category>> dataCategory() async {
    var url = Uri.parse('${MyConfig.uri}/Category');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Category.fromJson(json)).toList();
      } else {
        ('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error de conexión traer categorias: $e');
      return [];
    }
  }

  Future<List<Product>> fetchDataCategory(Category c) async {
    var url = Uri.parse('${MyConfig.uri}/Category/${c.id_category.toString()}');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        print(jsonData);
        return jsonData.map((json) => Product.fromJson(json)).toList();
      } else {
        ('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error de conexión: $e');
      return [];
    }
  }
}
