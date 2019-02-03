import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  //{} means optional arguments
  ProductEditPage({this.addProduct, this.updateProduct, this.product, this.productIndex});
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  
  final Map<String, dynamic>_formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };
  

  //needed for forms -> a form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//got this from stack overflow - check if data is number
  bool _isNumeric(String s) {
    if (s == null) {
      return false;
    }
    try {
      double.parse(s);
    } catch (e) {
      return false;
    }
    return true;
  }

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      initialValue: widget.product==null? "" : widget.product['title'],
      validator: (String val) {
        if (val.isEmpty || val.length < 5)
          return 'Title is required, 5 characters minimum';
      },
      onSaved: (String val) {
          _formData['title'] = val;
      }
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
      initialValue: widget.product==null? "" : widget.product['description'],
      maxLines: 4,
      validator: (String val) {
        if (val.isEmpty || val.length < 10)
          return 'Description is required, 10 chars minimum';
      },
      onSaved: (String val) {
          _formData['description']  = val;
      }
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price'),
      initialValue: widget.product==null? "" : widget.product['price'].toString(),
      keyboardType: TextInputType.number,
      validator: (String val) {
        return _isNumeric(val) == false ? "Price must be numeric" : null;
      },
      onSaved: (String val) {
         _formData['price'] =  double.parse(val);
      }
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate() == false) return;
    _formKey.currentState.save();
    if(widget.product==null){
      widget.addProduct(_formData);
    }
    else{
      widget.updateProduct(widget.productIndex, _formData);
    }
    
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _containWidth =
        _deviceWidth > 550.0 ? 500.0 : _deviceWidth * 0.95;
    //cant set width on Listview so we will do padding = dev-contain / 2
    final double _padding = (_deviceWidth - _containWidth) / 2;
    //wrap in gesture dectector to click OFF form to close keyboard

    Widget pageContent = 
    GestureDetector(
      onTap:(){
        FocusScope.of(context).requestFocus(FocusNode());
      },
     child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: _padding),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text("Save"),
                textColor: Colors.white,
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    ); //Gesture detector

      return widget.product==null? pageContent :
          Scaffold(
            appBar: AppBar(
              title: Text("Edit Product"),
            ),
            body: pageContent,
          );

  } //end widget build


}
