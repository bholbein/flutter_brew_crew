import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  // form validation
  final _formKey = GlobalKey<FormState>();

  // Scaffold state
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register to Brew Crew'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    new InputDecoration(labelText: 'Enter your mail address:'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter e-mail adress';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    new InputDecoration(labelText: 'Enter your password:'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.brown[700],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    final snackBar = SnackBar(
                        content: Text(
                      'Registration going on',
                      textAlign: TextAlign.center,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  print(email);
                  print(password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
