import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String title;
  TitleDefault(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        child: Text(title,
            style: TextStyle(
                fontSize: 26.0,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.bold)
        )
    );
  }
}
