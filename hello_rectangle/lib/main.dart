import 'package:flutter/material.dart';
import 'package:hello_rectangle/category_route.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
    );
  }
}

