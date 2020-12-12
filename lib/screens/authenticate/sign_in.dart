import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        title: Text('Sign in to Brew Crew'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
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
                onChanged: (val) {
                  setState(() => password = val);
                },
                validator: (value) => value.length < 6
                    ? 'Please enter password with 6 or more characters'
                    : null,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.brown[700],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      final snackBar = SnackBar(
                          content: Text(
                        'Signing in',
                        textAlign: TextAlign.center,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      dynamic result = await _auth.signInWithEmailAndPassWord(
                          email, password);
                      setState(() => error = result);
                    }
                  }),
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
