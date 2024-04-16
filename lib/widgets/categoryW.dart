import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CategoryW extends StatelessWidget {
  List<String> categorias = ["carnes", "granos", "lacteos", "verduras"];
  double width = 0;
  double height = 0;
  //List categorys;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Expanded(
        child: ListView(
            scrollDirection: Axis.horizontal, children: categoryBuild()));
  }

  List<Widget> categoryBuild() {
    List<Widget> categoryListBuild = [];

    categorias.forEach((element) {
      categoryListBuild.add(Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: height * 0.2,
            width: width * 0.4,
            alignment: AlignmentDirectional.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/categories/${element}.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
              element,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ));
      categoryListBuild.add(SizedBox(
        width: 20,
      ));
    });

    return categoryListBuild;
  }
}
