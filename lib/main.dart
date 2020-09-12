import 'package:flutter/material.dart';
import 'package:sqflite_demo/screens/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MaterialApp(
      home: ProductList(),
    );
  }
}
