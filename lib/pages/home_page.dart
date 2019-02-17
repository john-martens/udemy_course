import 'package:flutter/material.dart';
import 'package:section2/models/product.dart';
import 'package:section2/widgets/products/products.dart';

class HomePage extends StatelessWidget {
  final List<Product> products;

  HomePage(this.products);

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
              automaticallyImplyLeading: false, //gets rid of internal hamburger
              title: Text("Choose")),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Manage Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _buildDrawer(context),
        appBar: AppBar(
          title: Text("Easy List"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
        body: Products(products)
        //body: ProductManager(startingPoint: "Food Tester")
        );
  }
}
