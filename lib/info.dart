import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_app/Helpers/devicesize.dart';

class Info extends StatefulWidget {
  Info({Key key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String name = "";
  String email = "";
  String phoneno = "";
  String age = "";
  String height = "";
  String weight = "";

  Future<String> getpersonalinfo() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection("Users").doc(docname).get();
    setState(() {
      name = ds["name"];
      email = ds["email"];
      phoneno = ds["phoneno"];
      height = ds["height"];
      weight = ds["weight"];
      age = ds["age"];
    });

    return "yes";
  }

  Future addnametofirebase() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(docname)
        .update({"name": name});
  }

  Future addphonenotofirebase() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(docname)
        .update({"phoneno": phoneno});
  }

  Future addagetofirebase() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(docname)
        .update({"age": age});
  }

  Future addheighttofirebase() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(docname)
        .update({"height": height});
  }

  Future addweightofirebase() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(docname)
        .update({"weight": weight});
  }

  Future<void> _displayTextInputDialogofname(BuildContext context) async {
    String codeDialog;
    String valueText;

    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter your name'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              //decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      //   codeDialog = valueText;
                      name = valueText;
                    });
                    Navigator.pop(context);
                    addnametofirebase();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialogofphoneno(BuildContext context) async {
    String codeDialog;
    String valueText;

    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter your phoneno'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              //decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      //  codeDialog = valueText;
                      phoneno = valueText;
                    });
                    Navigator.pop(context);
                    addphonenotofirebase();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialogofage(BuildContext context) async {
    String codeDialog;
    String valueText;

    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter your age'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              //decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      //  codeDialog = valueText;
                      age = valueText;
                    });
                    Navigator.pop(context);
                    addagetofirebase();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialogofheight(BuildContext context) async {
    String codeDialog;
    String valueText;

    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter your height'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              //decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      // codeDialog = valueText;
                      height = valueText;
                    });
                    Navigator.pop(context);
                    addheighttofirebase();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialogofweight(BuildContext context) async {
    String codeDialog;
    String valueText;

    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter your weight'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              //decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      //codeDialog = valueText;
                      weight = valueText;
                    });
                    Navigator.pop(context);
                    addweightofirebase();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    getpersonalinfo();
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
          child: Container(
            height: displayHeight(context),
            width: displayWidth(context),
          ),
        ),
        Positioned(
          top: 0.0,
          child: Container(
            color: Colors.blue,
            height: displayHeight(context) * 0.35,
            width: displayWidth(context),
          ),
        ),
        Positioned(
            top: displayHeight(context) * 0.05,
            left: displayWidth(context) * 0.015,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ))),
        Positioned(
            top: displayHeight(context) * 0.1,
            child: Column(children: [
              Icon(
                Icons.account_circle,
                size: displayWidth(context) * 0.25,
                color: Colors.white,
              ),
              Divider(),
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: displayWidth(context) * 0.04),
              ),
              Text(
                email,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: displayWidth(context) * 0.04),
              ),
            ])),
        Positioned(
          top: displayHeight(context) * 0.41,
          child: Container(
            height: displayHeight(context) * 0.58,
            width: displayWidth(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Card displaying name !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Name :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            bottom: displayHeight(context) * 0.01,
                            child: IconButton(
                              onPressed: () =>
                                  _displayTextInputDialogofname(context),
                              icon: Icon(Icons.edit),
                            )),
                      ]),
                    ),
                  ),
                  Divider(),
                  //Card displaying phoneno !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Phoneno :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              phoneno,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            bottom: displayHeight(context) * 0.01,
                            child: IconButton(
                              onPressed: () =>
                                  _displayTextInputDialogofphoneno(context),
                              icon: Icon(Icons.edit),
                            )),
                      ]),
                    ),
                  ),
                  Divider(),
                  //Card displaying age !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Age :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              age,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            bottom: displayHeight(context) * 0.01,
                            child: IconButton(
                              onPressed: () =>
                                  _displayTextInputDialogofage(context),
                              icon: Icon(Icons.edit),
                            )),
                      ]),
                    ),
                  ),
                  Divider(),
                  //Card displaying height !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Height :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              height,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            bottom: displayHeight(context) * 0.01,
                            child: IconButton(
                              onPressed: () =>
                                  _displayTextInputDialogofheight(context),
                              icon: Icon(Icons.edit),
                            )),
                      ]),
                    ),
                  ),
                  Divider(),
                  //card displaying weight !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Weight :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              weight,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            bottom: displayHeight(context) * 0.01,
                            child: IconButton(
                              onPressed: () =>
                                  _displayTextInputDialogofweight(context),
                              icon: Icon(Icons.edit),
                            )),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
