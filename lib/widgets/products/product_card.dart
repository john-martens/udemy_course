import 'package:flutter/material.dart';
import 'package:section2/widgets/products/price_tag_widget.dart';
import 'package:section2/widgets/ui_element/address_tag.dart';
import 'package:section2/widgets/ui_element/title_default.dart';

class ProductCard extends StatelessWidget {
  final Map<String,dynamic> product;
  final int index;

  ProductCard(this.product,this.index);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']), 
          Container(
            padding: EdgeInsets.only(top:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleDefault(product['title']),
                PriceTagWidget(product['price']),
              ],
            )
            ),
          AddressTag("Union Square San Francisco"),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              color: Theme.of(context).accentColor,
              onPressed: (){
                Navigator.pushNamed<bool>(context,'/product/' + index.toString());
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.red,
              onPressed: (){
                
              },
            ),
          ],)
        ],
      ),
    );
  }
}