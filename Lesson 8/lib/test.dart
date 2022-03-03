import 'package:flutter/material.dart';

class homepane extends StatelessElement {
  homepane({Key ? key, required this.title}) : super (key: key);
  final String title;

  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.orange),
      padding: EdgeInsets.all(25), child: Center (
      child: Text (
        'Hello world', style: TextStyle (
        color: Colors.red, letterSpacing: 0.5, fontSize: 30,
      ),
        textDirection: TextDirection.ltr,
      ),
    ),
    );
  }
}