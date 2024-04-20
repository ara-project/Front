import "package:front_ara/entitys/product.dart";
import "package:flutter/material.dart";

class Facturas {

  final int codigoFactura;
  Map<String,List<Producto>> productos ={'1':[Producto("Suavitel", 6000, 1),Producto("Suavitel", 1000, 1)]};
  late Product producto;
  String direccion="";
  double envio=0.0;
  String tipoPago="";

   Facturas({required this.codigoFactura});
   
   
   List<Producto> listaProducto({required int codigoFactura}) {
   /* if (!productos.containsKey(codigoFactura.toString())) {
      productos[codigoFactura.toString()] = [];
    }*/
    return productos[codigoFactura.toString()]!;
  }

  double calcularSubtotal({required List<Producto> listaProductos}){
    double subtotal = 0;
    for(var producto in listaProductos){
      subtotal=subtotal+(producto.price*producto.cantidad);
    }
    return subtotal;
  }
}

class Producto{
  final String name;
  final double price;
  final int cantidad;

  Producto(this.name, this.price,this.cantidad);
}