import 'package:flutter/material.dart';
import 'package:section2/product_manager.dart';
//import 'package:flutter/rendering.dart';

void main(){
  //debugPaintSizeEnabled=true;
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowMaterialGrid: true,
      theme:ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Easy List")),
          body: ProductManager("Food Tester")
      )
    );
  }
}
