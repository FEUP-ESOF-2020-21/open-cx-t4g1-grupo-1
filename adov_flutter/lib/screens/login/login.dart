import 'package:adov_flutter/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _success;
  String _userEmail;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Ad\nOv",
              style: TitleTextStyle.copyWith(
                color: Colors.white,
                fontSize: 100,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24
                    ),
                    decoration: CustomInputDecorator.decorator("Email").copyWith(
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      labelStyle: TextStyle(
                          color: Colors.grey
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: TextFormField(
                    controller: _passwordController,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    decoration: CustomInputDecorator.decorator("Password").copyWith(
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      labelStyle: TextStyle(
                          color: Colors.grey
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  alignment: Alignment.center,
                  child: OutlineButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        _signInWithEmailAndPassword();
                      }
                    },
                    child: Text(
                      "Login",
                      style: TitleTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 50),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _signInWithEmailAndPassword() async {
    final User user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });

      print("email: " + _emailController.text);
      print("password: " + _passwordController.text);

      final snackBar = SnackBar(content: Text("Successfully Logged In..."));
      _scaffoldKey.currentState.showSnackBar(snackBar);

      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, HomeScreenRoute);
      });
    } else {
      setState(() {
        _success = false;
      });
      final snackBar = SnackBar(content: Text("Wrong credentials..."));
      print("email: " + _emailController.text);
      print("password: " + _passwordController.text);
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

