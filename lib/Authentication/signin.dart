import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_maps_app/Authentication/auth.dart';
import 'package:google_maps_app/Authentication/signup.dart';
import 'package:google_maps_app/Helpers/devicesize.dart';
import 'package:google_maps_app/home.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            // color: Colors.blue,
            height: displayHeight(context),
            width: displayWidth(context),
          )),
          Positioned(
            top: displayHeight(context) * 0.3,
            child: Card(
              elevation: 10.0,
              child: Container(
                height: displayHeight(context) * 0.45,
                width: displayWidth(context) * 0.9,
                color: Colors.white,
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: displayHeight(context) * 0.025,
                        width: displayWidth(context) * 0.8,
                      ),
                      Text(
                        "LOGIN",
                        style:
                            TextStyle(fontSize: displayWidth(context) * 0.045),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.05,
                        width: displayWidth(context) * 0.8,
                      ),
                      Container(
                        width: displayWidth(context) * 0.8,
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? "Enter an email" : null,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email), hintText: "Email"),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.02,
                        width: displayWidth(context) * 0.8,
                      ),
                      Container(
                        width: displayWidth(context) * 0.8,
                        child: TextFormField(
                          validator: (val) => val.length < 6
                              ? "The Password should be atleast 6 characters long"
                              : null,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Password"),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.04,
                        width: displayWidth(context) * 0.8,
                      ),
                      RaisedButton(
                          child: Text("Sign In"),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              dynamic result = await _auth
                                  .signinWithEmailAndPassword(email, password);

                              if (result == null) {
                                setState(() {
                                  error =
                                      "Could Not sign in with those credentials !!";
                                });
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) => Homepage()));
                              }
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: displayHeight(context) * 0.71,
            child: SizedBox(
              height: displayHeight(context) * 0.1,
              child: Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Positioned(
              top: displayHeight(context) * 0.9,
              child: Row(
                children: [
                  Text("Don't have an account ? "),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (Context) => SignUp()));
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
