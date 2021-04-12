import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_app/Authentication/signin.dart';
import 'package:google_maps_app/Helpers/devicesize.dart';
import 'package:google_maps_app/info.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';


class googlemaps extends StatefulWidget {
  @override
  _googlemapsState createState() => _googlemapsState();
}

class _googlemapsState extends State<googlemaps> {
  String name = "";
  String email = "";
  String phoneno = "";

  Future<String> getpersonalinfo() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection("Users").doc(docname).get();
    setState(() {
      name = ds["name"];
      email = ds["email"];
      phoneno = ds["phoneno"];
    });

    return "yes";
  }

  GoogleMapController _controller;

  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(21.311730, 76.226170));

  final List<Marker> markers = [];
  addMarker(cordinate) {
    int id = Random().nextInt(100);

    setState(() {
      markers
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    getpersonalinfo();
    

    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          
          Padding(
            padding: const EdgeInsets.only( bottom: 8.0),
            child: Container(
              color: Colors.blue,
              height: displayHeight(context) * 0.25,
              child: Column(
                children: [
                  SizedBox(
            height: displayHeight(context) * 0.035,
          ),
                  Icon(
                    Icons.account_circle,
                    color: Colors.white,
                   
                    size: displayWidth(context) * 0.25,
                  ),
                  Text(name,style: TextStyle(color: Colors.white,fontSize: displayWidth(context)*0.04),),
                  Text(email,style: TextStyle(color: Colors.white,fontSize: displayWidth(context)*0.04),),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.9,
            child: Divider(),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Info()));
            },
            leading: Icon(Icons.info),
            title: Text(
              "Information",
              style: TextStyle(fontSize: displayWidth(context) * 0.045),
            ),
          ),
          
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Hello User",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: Icon(Icons.logout))
        ],
      ),

      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate) {
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
