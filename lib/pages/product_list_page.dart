import 'package:flutter/material.dart';
import 'package:section2/pages/product_edit_page.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String,dynamic>> products;
  final Function updateProduct;
  ProductListPage(this.products, this.updateProduct);
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
     itemCount: products.length,
     itemBuilder: (BuildContext context, int index){
      return ListTile(
        leading: Image.asset(products[index]['image'],width: 50.0,height: 50.0),
        title: Text(products[index]['title']),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context){
                    return ProductEditPage(
                      product: products[index], 
                      updateProduct: updateProduct, 
                      productIndex: index
                    );
                }
                )
            );
          },
        ),
       );
     },
   );
  }
}