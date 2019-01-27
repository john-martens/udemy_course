import 'package:flutter/material.dart';
import 'package:section2/product_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: Drawer(
            child: Column(children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false, //gets rid of internal hamburger
                title: Text("Choose")
              ),
              ListTile(
                title: Text("Manage Products"),
                onTap: (){
                  Navigator.pushReplacementNamed(context,'/admin');
                },  
              )
            ],),
          ),
          appBar: AppBar(title: Text("Easy List")),
          body: ProductManager()
          //body: ProductManager(startingPoint: "Food Tester")
      );
  }
}