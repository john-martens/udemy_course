import 'package:flutter/material.dart';

class Products extends StatelessWidget {

  final List<Map<String, dynamic>> products;

  Products(this.products);

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
                Navigator.pushNamed<bool>(context,'/product/' + index.toString());
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
