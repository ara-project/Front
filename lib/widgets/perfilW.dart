import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PerfilW extends StatelessWidget {
  const PerfilW({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    Size tam = MediaQuery.of(context).size;
    return GestureDetector(
              child:LayoutBuilder(
          builder: (context, constraints) {
            double avatarRadius = constraints.maxWidth * 0.1;
            double cardWidth = constraints.maxWidth * 0.8;

            return Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: avatarRadius),
                    padding: EdgeInsets.all(16.0),
                    width: cardWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: avatarRadius + 10), // Space for the CircleAvatar
                        Text(
                          'Ddavid16',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Daniel Padilla',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '1066866440',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'ddavidpadilla@unicesar.edu.co',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: avatarRadius,
                      child: Icon(
                        Icons.person,
                        size: avatarRadius,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ), );
  }
}