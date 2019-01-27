import 'package:flutter/material.dart';
import 'package:section2/button_controller.dart';
import 'package:section2/products.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingPoint;
  //{} below means param is optional
  ProductManager({this.startingPoint});

  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
    void initState() {
      super.initState();
      if (widget.startingPoint != null){
        _products.add(widget.startingPoint);
      }
    }
  //this function will get passed into ButtonController Widget
  //then the ButtonController Widget can run that function
  void addProduct(Map<String, String> prod){
    setState(() {
          _products.add(prod);
    });
  }

  void deleteProduct(int index){
    setState(() {
          _products.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //making button as separate widget in other class
          //sending along the function that the button will run
          //can pass in the function as a parameter
          child: ButtonController(addProduct)
          ),
          Expanded(
            child: Products(_products, delFunction: deleteProduct)
        )
      ],
    );
  }
}
