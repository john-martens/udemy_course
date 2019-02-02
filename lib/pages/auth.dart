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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop)
            ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "email",
                  filled: true,
                  fillColor: Colors.white
                  ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String val) {
                  setState(() {
                    _emailVal = val;
                  });
                },
              ),
              SizedBox(height: 10.9),
              TextField(
                decoration: InputDecoration(
                  labelText: "password",
                  filled: true,
                  fillColor: Colors.white
                  ),
                obscureText: true,
                onChanged: (String val) {
                  setState(() {
                    _passwordVal = val;
                  });
                },
              ),
              SwitchListTile(
                  value: true,
                  onChanged: (bool val) {
                    setState(() {
                      _acceptTerms = val;
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
                  print(_acceptTerms);
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
