import 'package:flutter/material.dart';

class ButtonController extends StatelessWidget {
  //can receive a void function when constructed
  final Function btncode;
  ButtonController(this.btncode);

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(10.0),
        child: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text("add produce"),
            onPressed: () {
              //call function received from parent
              btncode("New Product");      
              }
          )    
    );
  }
}