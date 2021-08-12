import 'package:flutter/material.dart';

class OnSaleProducts extends StatefulWidget{
  const OnSaleProducts({Key? key}) : super(key: key);

  @override
  _OnSaleProductsPage createState() =>_OnSaleProductsPage();

}

class _OnSaleProductsPage extends State<OnSaleProducts>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('OnSale Page'),
        ),

      ),
    );
  }
}