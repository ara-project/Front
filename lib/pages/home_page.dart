import 'package:flutter/material.dart';
import 'package:front_ara/widgets/categoryW.dart';
import 'package:front_ara/widgets/productsW.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
                productW()
              ],
            )));
  }
}
