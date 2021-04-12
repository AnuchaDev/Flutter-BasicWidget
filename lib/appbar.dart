import 'package:flutter/material.dart';

class Appbar_workshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "AppBar",
    home: Scaffold(
      appBar: AppBar(title: Text("AppBar"),),
    ),);
  }
}
