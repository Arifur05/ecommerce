import 'package:flutter/material.dart';

import 'Views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  static const String title = 'eCommerce';
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.indigo),
    home: Home(),

  );

}
