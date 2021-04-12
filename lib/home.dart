import 'package:flutter/material.dart';
import 'googlemaps.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  bool showMap = false;
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() {
        showMap = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return googlemaps();
  }
}
