import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:front_ara/config.dart';

class Category {
  int id_category = 0;
  String name = '';
  String imgSrc = '';

  Category(
      {required this.id_category, required this.name, required this.imgSrc}) {}

  factory Category.fromJson(Map<String, dynamic> json) {
    var encoded = latin1.encode(json['category'].toString());
    var categoryDecoded = utf8.decode(encoded);
    return Category(
        id_category: json['id_category'] ?? 0,
        name: categoryDecoded,
        imgSrc: json['imgSrc'] ?? 0);
  }
}
