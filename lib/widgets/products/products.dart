import 'package:flutter/material.dart';
import 'package:section2/models/product.dart';
import 'package:section2/widgets/products/product_card.dart';

class Products extends StatelessWidget {

  final List<Product> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    Widget productCard;
    //if we have products show them
    if (products.length > 0) {
       productCard = ListView.builder(
            itemBuilder: (context, int index) => 
                ProductCard(products[index], index),
            itemCount: products.length
          );
    }
    else{
        productCard = Container();
    }

    return productCard;
  }
}
