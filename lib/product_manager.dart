import 'package:flutter/material.dart';
import 'package:section2/products.dart';

class ProductManager extends StatefulWidget {
  final String startingPoint;
  ProductManager(this.startingPoint);

  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
    void initState() {
      super.initState();
      _products.add(widget.startingPoint);
    }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
               color: Theme.of(context).primaryColor,
                child: Text("add produce"),
                onPressed: () {
                  setState(() {
                    _products.add("Advanced Food Tester");
                  });
                }
            )
          ),
        Products(_products)
      ],
    );
  }
}
