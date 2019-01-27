import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailVal;
  String _passwordVal;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "email"),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String val) {
              setState(() {
                _emailVal = val;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "password"),
            obscureText: true,
            onChanged: (String val) {
              setState(() {
                _passwordVal = val;
              });
            },
          ),
          SwitchListTile(
              value: true,
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                });
              },
              title: Text("Accept Terms")),
          SizedBox(height: 10.0),
          RaisedButton(
            child: Text("Login"),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {
              print(_emailVal);
              print(_passwordVal);
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ]),
      ),
    );
  }
}
