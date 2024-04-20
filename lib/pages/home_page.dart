import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:front_ara/config.dart';
import 'package:front_ara/entitys/category.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:front_ara/pages/ShoppingCart.dart';
import 'package:front_ara/widgets/categoryW.dart';
import 'package:front_ara/widgets/ProductsW.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late List<Product> _fetchDataFuture = [];
  late List<Category> _fetchDataFutureCategory = [];
  Map<Product, int> shoppingCart = {};
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController _searchController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: height * 0.10,
            leadingWidth: width,
            leading: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(236, 117, 35, 1)),
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    IconButton(onPressed: () => {}, icon: Icon(Icons.reorder)),
                    Container(
                        height: height * 0.05,
                        width: width * 0.6,
                        child: SearchBar(
                          controller: _searchController,
                          hintText: "Buscar",
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.all(5)),
                          leading: const Icon(Icons.search),
                        )),
                    IconButton(
                        onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShoppingCart(cart: this.shoppingCart),
                                ),
                              )
                            },
                        icon: Icon(Icons.local_grocery_store)),
                    IconButton(onPressed: () => {}, icon: Icon(Icons.flip)),
                  ],
                ),
              ),
            )),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Categorias",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                CategoryW(
                  categorias: _fetchDataFutureCategory,
                  onCategorySelected: (Category selectCategory) =>
                      {fetchDataCategory(selectCategory)},
                ),
                SizedBox(height: (0.04 * height)),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Productos",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                ProductsW(
                  addProduct: (Product producto) =>
                      {addProductShoppingCart(producto)},
                  products: _fetchDataFuture,
                )
              ],
            )));
  }

  void addProductShoppingCart(Product p) {
    setState(() {
      bool flag = false;
      if (shoppingCart.containsKey(p)) {
        developer.log("Encontre el prodcuto");
        shoppingCart[p] = (shoppingCart[p] ?? 0) + 1;
      } else {
        shoppingCart[p] = 1;
      }
    });
  }

  fetchDataCategory(Category c) async {
    var url = Uri.parse(MyConfig.uri + '/Category/' + c.id_category.toString());

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          _fetchDataFuture = [];
          _fetchDataFuture =
              jsonData.map((json) => Product.fromJson(json)).toList();
        });
        developer.log(jsonDecode(response.body).toString());
      } else {
        // La solicitud falló con un código de estado no 200

        ('Error: ${response.statusCode}');
      }
    } catch (e) {
      developer.log('Error de conexión: $e');
    }
  }

  fetchData() async {
    var url = Uri.parse(MyConfig.uri + '/Product');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          _fetchDataFuture =
              jsonData.map((json) => Product.fromJson(json)).toList();
        });
      } else {
        // La solicitud falló con un código de estado no 200

        ('Error: ${response.statusCode}');
      }
    } catch (e) {
      developer.log('Error de conexión: $e');
    }
    url = Uri.parse(MyConfig.uri + '/Category');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          _fetchDataFutureCategory =
              jsonData.map((json) => Category.fromJson(json)).toList();
        });
      } else {
        // La solicitud falló con un código de estado no 200

        ('Error: ${response.statusCode}');
      }
    } catch (e) {
      developer.log('Error de conexión: $e');
    }
  }
}
