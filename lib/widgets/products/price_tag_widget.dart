import 'package:flutter/material.dart';

class PriceTagWidget extends StatelessWidget {

  final double price;
  PriceTagWidget(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
        child: Text("\$" + price.toString(),
            style: TextStyle(color: Colors.white)));
  }
}
