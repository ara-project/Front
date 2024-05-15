import 'package:flutter/material.dart';
import 'package:front_ara/entitys/category.dart';
import 'dart:developer' as developer;

//Widget de cada una de las categorias  y sus metodos
class CategoryW extends StatelessWidget {
  List<Category> categorias = [];
  double width = 0;
  double height = 0;
  Function(Category) onCategorySelected;

  CategoryW(
      {Key? key, required this.categorias, required this.onCategorySelected});
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categorias.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    //Metodo para cargar productos de cada categoria
                    onCategorySelected(categorias[index]);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                          width: width * 0.45,
                          alignment: AlignmentDirectional.bottomCenter,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(categorias[index].imgSrc),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(40),
                          )),
                      SizedBox(width: width * 0.5)
                    ],
                  ));
            }));
  }
}
