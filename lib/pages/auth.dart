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

  DecorationImage _getBG() {
    return DecorationImage(
        image: AssetImage('assets/background.jpg'),
        fit: BoxFit.fill,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop));
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: "email", filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String val) {
        setState(() {
          _emailVal = val;
        });
      },
    );
  }

  Widget _buildPassWordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: "password", filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String val) {
        setState(() {
          _passwordVal = val;
        });
      },
    );
  }

  Widget _buildAcceptTermsSwitch() {
    return SwitchListTile(
        value: true,
        onChanged: (bool val) {
          setState(() {
            _acceptTerms = val;
          });
        },
        title: Text("Accept Terms"));
  }

  void _submitForm() {
    print(_emailVal);
    print(_passwordVal);
    print(_acceptTerms);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _containWidth = _deviceWidth > 550? 500.0 :  _deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        decoration: BoxDecoration(
          image: _getBG(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: _containWidth,
              child: Column(children: <Widget>[
                _buildEmailTextField(),
                SizedBox(height: 10.0),
                _buildPassWordTextField(),
                _buildAcceptTermsSwitch(),
                SizedBox(height: 10.0),
                RaisedButton(
                    child: Text("Login"),
                    textColor: Colors.white,
                    onPressed: _submitForm
                ),
                /* 
                Alternative:  Custom button as Container wrapped in Gesture Dector
                */
                GestureDetector(
                  onTap: _submitForm,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.0,
                    child: Text("Log in With Custom Button"),
                    color: Colors.greenAccent,
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
