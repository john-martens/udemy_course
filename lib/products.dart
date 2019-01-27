import 'package:flutter/material.dart';
import 'package:section2/pages/product_page.dart';

class Products extends StatelessWidget {

  final List<Map<String, String>> products;
  final Function delFunction;

  Products(this.products, {this.delFunction});

  Widget _productItem(BuildContext context, int index){
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']), 
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
              child: Text("Details"),
              onPressed: (){
                Navigator.push<bool>(context, 
                  MaterialPageRoute(
                    builder: (BuildContext ctx) => 
                      ProductPage(products[index]['title'],products[index]['image'])
                  )
                ).then((bool value){
                    if(value){
                      delFunction(index);
                    }
                });
              },
            )
          ],)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget productCard;
    //if we have products show them
    if (products.length > 0) {
       productCard = ListView.builder(
            itemBuilder: _productItem,
            itemCount: products.length
          );
    }
    else{
        productCard = Container();
    }

    return productCard;
  }
}
