import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:front_ara/entitys/product.dart';
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
                        onPressed: () => {},
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
                CategoryW(),
                SizedBox(height: (0.04 * height)),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Productos",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                ProductW(
                  products: _fetchDataFuture,
                )
              ],
            )));
  }

  fetchData() async {
    var url = Uri.parse('http://192.168.1.33:80/Product');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
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
}
