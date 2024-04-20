import 'package:flutter/material.dart';
import 'package:front_ara/entitys/product.dart';
import 'package:front_ara/entitys/factura.dart';

class Factura extends StatelessWidget {
  const Factura({super.key});

  @override
  Widget build(BuildContext context) {
    Facturas factura =  Facturas(codigoFactura: 1);
    return Scaffold(
      appBar: AppBar(
            title: const Text("Detalles") ,
            backgroundColor: const Color.fromARGB(255, 242, 40, 26),
        ),
      body:  
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SizedBox(width:  20),
              const Text("Unidades"),
              SizedBox(width:  20),
              const Text("Nombre"),
              SizedBox(width: 20),
              const Text("Precio"),
            ]
            ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(width: 20),
            for(var producto in factura.listaProducto(codigoFactura: 1))
              Row(children: [
                SizedBox(width: 50),
                Text("${producto.cantidad}"),
                SizedBox(width: 40),
                Text(producto.name),
                SizedBox(width: 25,),
                Text("${producto.price}",)
              ],)
          ],)
        ]
      )
    );
  }
}
