import 'package:flutter/material.dart';
import 'package:section2/pages/product_create_page.dart';
import 'package:section2/pages/product_list_page.dart';

class ProductAdminPage extends StatelessWidget {

  final Function addProduct;
  final Function deleteProduct;

  ProductAdminPage(this.addProduct,this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, //gets rid of internal hamburger
              title: Text("Choose")
            ),
            ListTile(
              title: Text("See All Products"),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/products');
              },  
            )
          ],),
        ),
        appBar: AppBar(
          title: Text("Manage Products"),
          bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.create), text: "Create Product"),
            Tab(icon: Icon(Icons.list),text: "My Products"),
          ],),
          ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(addProduct),
            ProductListPage()
          ],
        )
     )
    );
  }
}