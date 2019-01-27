import 'package:flutter/material.dart';
import 'package:section2/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: RaisedButton(
          child: Text("Login"),
          onPressed: (){
              Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context)=> HomePage()));
          },
          ),
        ),
    );
  }
}