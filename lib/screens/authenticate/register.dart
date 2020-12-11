import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  // form validation
  final _formKey = GlobalKey<FormState>();

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
                validator: (value) => EmailValidator.validate(value)
                    ? null
                    : 'Please enter e-mail adress',
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    new InputDecoration(labelText: 'Enter your password:'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) {
                  setState(() => password = value);
                },
                validator: (value) => value.length < 6
                    ? 'Please enter password with 6 or more characters'
                    : null,
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
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'please try agagin');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
