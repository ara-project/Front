import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:front_ara/controllers/categoryC.dart';
import 'package:front_ara/controllers/oauthC.dart';
import 'package:front_ara/controllers/productoC.dart';
import 'package:front_ara/entitys/category.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:front_ara/pages/ShoppingCart.dart';
import 'package:front_ara/pages/detail_page.dart';
import 'package:front_ara/widgets/categoryW.dart';
import 'package:front_ara/widgets/ProductsW.dart';
import 'package:front_ara/widgets/configW.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  oauthC oaucthc = oauthC();
  late List<Product> _fetchDataFuture = [];
  late List<Category> _fetchDataFutureCategory = [];
  late List<Product> suggestionList = [];
  Map<Product, int> shoppingCart = {};
  ProductC productc = ProductC();
  CategoryC categoryc = CategoryC();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //Traer los datos al inicio del widget
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SearchController __controller = SearchController();

    return Scaffold(
        drawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        drawer: Drawer(
          child: configW(closeSesion: oaucthc.logout),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: height * 0.10,
            leadingWidth: width,
            leading: Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(236, 117, 35, 1)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => {_openDrawer()},
                        icon: const Icon(Icons.menu)),
                    Container(
                      height: height * 0.05,
                      width: width * 0.6,
                      child: SearchAnchor(
                          viewOnSubmitted: (s) async {
                            setState(() {
                              __controller.closeView(s);
                            });
                            if (__controller.text != '') {
                              await productc
                                  .fetchDatassuggestion(__controller.text);
                              _fetchDataFuture = suggestionList;
                            } else {
                              fetchData();
                            }
                            ;
                          },
                          builder: (BuildContext context,
                              SearchController controller) {
                            return SearchBar(
                              onTap: () {
                                controller.openView();
                              },
                              onSubmitted: (_) async {
                                if (controller.text != '') {
                                  _fetchDataFuture = await productc
                                      .fetchDatassuggestion(controller.text);
                                } else {
                                  fetchData();
                                }
                                ;
                              },
                              onChanged: (_) {
                                controller.openView();
                              },
                              controller: controller,
                              hintText: "Buscar productos",
                              padding:
                                  const MaterialStatePropertyAll<EdgeInsets>(
                                      EdgeInsets.all(5)),
                              leading: const Icon(Icons.search),
                            );
                          },
                          viewBackgroundColor: Colors.white,
                          viewConstraints:
                              BoxConstraints(maxWidth: width * 0.6),
                          suggestionsBuilder: (BuildContext context,
                              SearchController controller) async {
                            suggestionList = await productc
                                .fetchDatassuggestion(controller.text);
                            return List<ListTile>.generate(
                                suggestionList.length, (int index) {
                              __controller = controller;
                              return ListTile(
                                title: Text(suggestionList[index].name),
                                onTap: () {
                                  setState(() {
                                    controller
                                        .closeView(suggestionList[index].name);
                                    _fetchDataFuture = [suggestionList[index]];
                                  });
                                },
                              );
                            });
                          }),
                    ),
                    IconButton(
                        onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShoppingCart(cart: shoppingCart),
                                ),
                              )
                            },
                        icon: const Icon(Icons.local_grocery_store)),
                    IconButton(
                        onPressed: () async {
                          var res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SimpleBarcodeScannerPage(),
                              ));
                          if (res is String) {
                            Product productScan =
                                await productc.fetchproductbyid(res.toString());
                            if (productScan.idProduct > 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailproduct(
                                    product: productScan,
                                    addProduct: addProductShoppingCart,
                                  ),
                                ),
                              );
                            } else {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      child: Center(
                                        child: Text(res),
                                      ),
                                    );
                                  });
                            }
                          }
                        },
                        icon: const Icon(Icons.flip)),
                  ],
                ),
              ),
            )),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: const Text(
                    "Categorias",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                _fetchDataFutureCategory.isNotEmpty
                    ? CategoryW(
                        categorias: _fetchDataFutureCategory,
                        onCategorySelected: (Category selectCategory) =>
                            {fetchDataCategory(selectCategory)},
                      )
                    : const CircularProgressIndicator(),
                SizedBox(height: (0.04 * height)),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: const Text(
                    "Productos",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                _fetchDataFuture.isNotEmpty
                    ? ProductsW(
                        addProduct: (Product producto) =>
                            {addProductShoppingCart(producto)},
                        products: _fetchDataFuture,
                      )
                    : const Expanded(
                        flex: 5,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
              ],
            )));
  }

  //Abriel la ventana izquierda
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  //Añadir producto al carrtido de compras
  void addProductShoppingCart(Product p) {
    setState(() {
      if (shoppingCart.containsKey(p)) {
        shoppingCart[p] = (shoppingCart[p] ?? 0) + 1;
      } else {
        shoppingCart[p] = 1;
      }
    });
  }

  //Traer las cateforias
  fetchDataCategory(Category c) async {
    _fetchDataFuture = await categoryc.fetchDataCategory(c);
    setState(() {
      _fetchDataFuture;
    });
  }

  //Buscar producto por id
  fetchproductbyId(String id) async {
    await productc.fetchproductbyid(id);
  }

  //Traer productos y categorias
  fetchData() async {
    _fetchDataFuture = await productc.dataProducts();
    _fetchDataFutureCategory = await categoryc.dataCategory();
    setState(() {
      _fetchDataFuture;
      _fetchDataFutureCategory;
    });
  }
}
