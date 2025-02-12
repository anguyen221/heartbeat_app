import 'package:flutter/material.dart';

void main() {
  runApp(ValentineApp());
}

class ValentineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        body: Center(
          child: Text(
            "Happy Valentine's Day!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
