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
        child: SizedBox(
      height: screenHeigth * 0.9,
      width: screenWidth * 0.9,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: screenWidth * 0.75,
              height: screenHeigth * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: Colors.orange,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  
                  Positioned(
                      bottom: screenHeigth * 0.32,
                      left: screenWidth * 0.225,
                      child: Column(
                        children: [
                          Text(
                            'Ddavid16',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: tam.width * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Daniel Padilla',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: tam.width * 0.02,
                              )),
                        ],
                      )),
                  Positioned(
                      bottom: screenHeigth * 0.2,
                      left: screenWidth * 0.225,
                      child: Text(
                        '1066866440',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: tam.width * 0.03,
                        ),
                      )),
                  Positioned(
                    bottom: screenHeigth * 0.15,
                    left: screenWidth * 0.1,
                    child: Text('ddavidpadilla@unicesar.edu.co',
                        style: TextStyle(
                            color: Colors.black, fontSize: tam.width * 0.03)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}