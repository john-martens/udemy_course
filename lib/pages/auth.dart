import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {

  final Map<String,dynamic> _loginData = {
    'email': null,
    'password': null,
    "terms": false
  };
  String _emailVal;
  String _passwordVal;
  bool _acceptTerms = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  

  DecorationImage _getBG() {
    return DecorationImage(
        image: AssetImage('assets/background.jpg'),
        fit: BoxFit.fill,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop));
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "email", filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (String val){
        if(val.isEmpty) 
        return "Invalid email";
      },
      onSaved: (String val) {
          _loginData['email'] = val;
      }
    );
  }

  Widget _buildPassWordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "password", filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String val){
        if(val.isEmpty || val.length < 4)
          return "Password must be min of 4 characters";
      },
      onSaved: (String val) {
          _loginData['password'] = val;
      }
    );
  }

  Widget _buildAcceptTermsSwitch() {
    return SwitchListTile(
        value: _loginData['terms'],
        onChanged: (bool val) {
            _loginData['terms']=val;
        },
        title: Text("Accept Terms"));
  }

  void _submitForm() {
    if(_formKey.currentState.validate()==false || _loginData['terms']==false){
      return;
    }
    _formKey.currentState.save();
    print(_loginData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _containWidth =
        _deviceWidth > 550 ? 500.0 : _deviceWidth * 0.95;
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
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(height: 10.0),
                  _buildPassWordTextField(),
                  _buildAcceptTermsSwitch(),
                  SizedBox(height: 10.0),
                  RaisedButton(
                      child: Text("Login"),
                      textColor: Colors.white,
                      onPressed: _submitForm),
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
      ),
    );
  }
}
