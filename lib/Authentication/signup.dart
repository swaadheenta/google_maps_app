import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_maps_app/Authentication/auth.dart';
import 'package:google_maps_app/Authentication/signin.dart';
import 'package:google_maps_app/Helpers/devicesize.dart';
import 'package:google_maps_app/home.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = " ";
  String username="";
  String phoneno="";
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
            top: displayHeight(context) * 0.15,
            child: Card(
              elevation: 10.0,
                          child: Container(
                height: displayHeight(context) * 0.65,
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
                       Text("REGISTER",style:TextStyle(fontSize: displayWidth(context)*0.045),),
                      SizedBox(
                        height: displayHeight(context) * 0.035,
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
                              prefixIcon: Icon(Icons.lock), hintText: "Password"),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
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
                            ? "Username should be atleast 6 characters long"
                            : null,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle), hintText: "Username"),
                        //obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            username = val;
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
                        validator: (val) => val.length !=10
                            ? "phoneno should be of 10 characters"
                            : null,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone), hintText: "Phoneno"),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            phoneno = val;
                          });
                        },
                      ),
                    ),
                       SizedBox(
                        height: displayHeight(context) * 0.04,
                        width: displayWidth(context) * 0.8,
                      ),
                      RaisedButton(
                          child: Text("Sign Up"),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              dynamic result = await _auth .registerWithEmailAndPassword(email, password,username,phoneno);

                              if (result == null) {
                                setState(() {
                                  error =
                                      "Could not register with this credentials !!";
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
          Positioned( top: displayHeight(context)*0.85,
            child: SizedBox(
                          height: displayHeight(context)*0.1,
                          child: Text(error,style: TextStyle(color: Colors.red),),
                        ),),
          Positioned(
            top: displayHeight(context)*0.9,
              child: Row(
            children: [
              Text("Already have an account ? "),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Context) => SignIn()));
                  },
                  child: Text(
                    "Login Now",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ))
        ],
      ),
    );
  }
}

