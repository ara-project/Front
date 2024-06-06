import 'package:flutter/material.dart';
import 'package:front_ara/entitys/category.dart';
import 'dart:developer' as developer;

class CategoryW extends StatefulWidget {
  final List<Category> categorias;
  final Function(Category) onCategorySelected;

  CategoryW(
      {Key? key, required this.categorias, required this.onCategorySelected})
      : super(key: key);

  @override
  _CategoryWState createState() => _CategoryWState();
}

//Widget de cada una de las categorias  y sus metodos
class _CategoryWState extends State<CategoryW> {
  Category? selectedCategory;

  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categorias.length,
            itemBuilder: (context, index) {
              Category category = widget.categorias[index];
              bool isSelected = category == selectedCategory;
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                    widget.onCategorySelected(widget.categorias[index]);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                          width: width * 0.45,
                          alignment: AlignmentDirectional.bottomCenter,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.categorias[index].imgSrc),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(40),
                            border: isSelected
                                ? Border.all(color: Colors.black, width: 4)
                                : null,
                          )),
                      SizedBox(width: width * 0.5)
                    ],
                  ));
            }));
  }
}
