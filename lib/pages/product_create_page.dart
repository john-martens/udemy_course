import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);
@override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}
class _ProductCreatePageState extends State<ProductCreatePage>{
  String _title='';
  String _description='';
  double _price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: 'Product Title'
          ),
         onChanged: (String val){
           setState(() {
            _title=val;          
            });
         },
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Product Description'
          ),
          maxLines: 4,
         onChanged: (String val){
           setState(() {
            _description=val;          
            });
         },
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Price'
          ),
          keyboardType: TextInputType.number,
         onChanged: (String val){
           setState(() {
            _price=double.parse(val);          
            });
         },
        ),
        SizedBox(height: 10.0),
        RaisedButton(
          child: Text("Save"),
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          onPressed: (){
            final Map<String, dynamic> product = {
              'title': _title,
              'description': _description,
              'price': _price,
              'image': 'assets/food.jpg'
              };
            widget.addProduct(product);
            Navigator.pushReplacementNamed(context,'/products');
          },
        )
      ],
      ),
    );
  
  }
}

  /* old modal
    return Center(
      child: RaisedButton(
        child: Text("Save"),
        onPressed: (){
          showModalBottomSheet(context: context,
          builder: (context){
            return Center(
              child: Text("This is a modal")
            );
          });
        },
      ),
    );
    */