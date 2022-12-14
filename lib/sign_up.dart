import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
                validator: (value) {
                  String _temp = value.toString();
                  int count_char = 0;
                  int count_num = 0;
                  bool go = true;
                  for(int i =0; i < _temp.length; i++){

                    int t =  _temp.codeUnitAt(i);
                    if(((97 <= t) &&(t <= 122)) ||((65 <= t) &&(t <= 90))){
                      count_char++;
                    }
                    if(((48 <= t) &&(t <= 57)) ){
                      count_num++;
                    }
                    if((3 <= count_char) && (3 <= count_num)){
                      go = false;
                    }
                  }
                  if (value!.isEmpty || go) {
                    return 'Username is invalid';
                  }
                  return null;
                },
              ),
// spacer
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _passwordConfirmController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty ||
                      (_passwordController.text !=
                          _passwordConfirmController.text)) {
                    return 'Confirm Password doesn??t match Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _emailAddressController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Email Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Email Address';
                  }
                  return null;
                },
              ),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE0E0E0),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
