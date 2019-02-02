import 'package:flutter/material.dart';
import 'package:section2/widgets/ui_element/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title, imageUrl, description;
  final double price;

  ProductPage(this.title, this.imageUrl, this.price,this.description);

/*
  _showWarningDialog(BuildContext context) {
    showDialog(context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are You Sure?"),
            content: Text("This action cannot be undone"),
            actions: <Widget>[
              FlatButton(
                child: Text("CANCEL"),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text("DELETE"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ), //flatb
            ], //widget
          ); //alet diag
        });
  }
*/
  //wrap entire scaffold as a child inside WillPopScope
  //this allows you to control back arrow code and return a value
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false); //no we did NOT hit delete
          return Future.value(false); //only pop once?
        },
        child: (Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageUrl),
                TitleDefault(title),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text('Union Square, San Francisco', style: TextStyle(fontFamily: 'Oswald',color: Colors.grey)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0), 
                    child: Text('|', style: TextStyle(color: Colors.grey))
                  ),
                  Text("\$" + price.toString(), style: TextStyle(fontFamily: 'Oswald',color: Colors.grey))
                ],
                ),
                Container(
                  padding: EdgeInsets.all(10.0) ,
                  child: Text(description,textAlign: TextAlign.center)
                )
              ],
            ))) //child
        );
  }
}
