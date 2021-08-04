import 'package:flutter/material.dart';

import 'Views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,

  );

}
