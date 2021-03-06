import 'package:flutter/material.dart';
import 'package:section2/pages/auth.dart';
import 'package:section2/pages/home_page.dart';
import 'package:section2/pages/product_admin.dart';
import 'package:section2/pages/product_page.dart';
import 'package:section2/models/product.dart';

//import 'package:flutter/rendering.dart';

void main(){
  //debugPaintSizeEnabled=true;
  runApp(MyApp());
} 

class MyApp extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp>{

  List<Product> _products = [];

  //this function will get passed into ButtonController Widget
  //then the ButtonController Widget can run that function
  void addProduct(Product prod){
    setState(() {
          _products.add(prod);
    });
  }

  void deleteProduct(int index){
    setState(() {
          _products.removeAt(index);
    });
  }

 void updateProduct(int index, Product newproduct){
    setState(() {
          _products[index] = newproduct;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowMaterialGrid: true,
      theme:ThemeData(
        //brightness:  Brightness.light -> can also do dark
        //fontFamily:  'Oswald' -> set for entire app
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        buttonColor: Colors.deepPurple
      ),
      //home: AuthPage(),
      routes: {
        '/' : (BuildContext context) => AuthPage(),
        '/products' : (BuildContext context) => HomePage(_products),
        '/admin' : (BuildContext context) => ProductAdminPage(addProduct, updateProduct, deleteProduct, _products), 
      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElements = settings.name.split('/');
        if(pathElements[0] != ''){
          return null;
        }
        if(pathElements[1]=='product'){
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (context) => 
                ProductPage(
                  _products[index].title,
                  _products[index].image,
                  _products[index].price,
                  _products[index].description
                ) 
            );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => 
            HomePage(_products));
      },
    );
  }
}
