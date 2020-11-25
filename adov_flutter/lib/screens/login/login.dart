import 'dart:io';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode _focus1 = new FocusNode();
  FocusNode _focus2 = new FocusNode();
  bool _showTitle = true;

  @override
  void initState() {
    super.initState();
    _focus1.addListener(_onFocusChange);
    _focus2.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: (!_showTitle),
      key: _scaffoldKey,
      backgroundColor: MainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (_showTitle) ? Container(
            child: Text(
              "Ad\nOv",
              style: TitleTextStyle.copyWith(
                color: Colors.white,
                fontSize: 100,
              ),
            ),
          ) :
          Text(""),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _focus1,
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                    decoration:
                    CustomInputDecorator.decorator("Email").copyWith(
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
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
                    focusNode: _focus2,
                    autocorrect: false,
                    obscureText: true,
                    decoration:
                    CustomInputDecorator.decorator("Password").copyWith(
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
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
                  alignment: Alignment.center,
                  child: OutlineButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        FocusScope.of(context).unfocus();
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
                Container(
                  alignment: Alignment.center,
                  child: OutlineButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, HomeScreenRoute),
                    child: Text(
                      "Guest",
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
    User user;
    SnackBar snackBar;

    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
    } on FirebaseAuthException catch  (e) {
      switch (e.code) {
        case 'invalid-email':
          snackBar = SnackBar(content: Text("Invalid Email Format"));
          _scaffoldKey.currentState.showSnackBar(snackBar);
          break;
        case 'user-not-found':
          snackBar = SnackBar(content: Text("User Not Found"));
          _scaffoldKey.currentState.showSnackBar(snackBar);
          break;
        case 'wrong-password':
          snackBar = SnackBar(content: Text("Wrong Password"));
          _scaffoldKey.currentState.showSnackBar(snackBar);
          break;
        default:
          break;
      }
      print('Failed with error code: ${e.code}');
      print(e.message);
    }


    if (user != null) {
      snackBar = SnackBar(content: Text("Successfully Logged In..."));
      _scaffoldKey.currentState.showSnackBar(snackBar);

      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, HomeScreenRoute);
      });
    }
  }

  void _onFocusChange() {
    setState(() {
      _showTitle = !_focus1.hasFocus && !_focus2.hasFocus;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
