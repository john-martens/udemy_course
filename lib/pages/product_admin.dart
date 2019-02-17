import 'package:flutter/material.dart';
import 'package:section2/models/product.dart';
import 'package:section2/pages/product_edit_page.dart';
import 'package:section2/pages/product_list_page.dart';


class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final List<Product> products;

  ProductAdminPage(this.addProduct, this.updateProduct, this.deleteProduct,this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
              automaticallyImplyLeading: false, //gets rid of internal hamburger
              title: Text("Choose")),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("See All Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: _buildSideDrawer(context),
            appBar: AppBar(
              title: Text("Manage Products"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.create), text: "Create Product"),
                  Tab(icon: Icon(Icons.list), text: "My Products"),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ProductEditPage(addProduct: addProduct),
                ProductListPage(products, updateProduct, deleteProduct)
              ],
            )));
  }
}
