import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _title = '';
  String _description = '';
  double _price;

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _title,
      'description': _description,
      'price': _price,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _containWidth = _deviceWidth > 550.0? 500.0 :  _deviceWidth * 0.95;
    //cant set width on Listview so we will do padding = dev-contain / 2
    final double _padding = (_deviceWidth - _containWidth) / 2;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: _padding),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Product Title'),
            onChanged: (String val) {
              setState(() {
                _title = val;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Description'),
            maxLines: 4,
            onChanged: (String val) {
              setState(() {
                _description = val;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            onChanged: (String val) {
              setState(() {
                _price = double.parse(val);
              });
            },
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            child: Text("Save"),
            textColor: Colors.white,
            onPressed: _submitForm,
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
