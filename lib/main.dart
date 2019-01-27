import 'package:flutter/material.dart';
import 'package:section2/pages/auth.dart';
import 'package:section2/pages/home_page.dart';
import 'package:section2/pages/product_admin.dart';
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
      //home: AuthPage(),
      routes: {
        '/' : (BuildContext context) => HomePage(),
        '/admin' : (BuildContext context) => ProductAdminPage(),
      },
    );
  }
}
