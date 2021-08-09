import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidgetContainer extends StatefulWidget {
  const HomeWidgetContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeWidgetContainerState();
}

class HomeWidgetContainerState extends State<HomeWidgetContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  child: Text(
                    'Choose brand',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      //letterSpacing: 0.5,
                      fontSize: 16,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [Text('See All',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    //letterSpacing: 0.5,
                    fontSize: 16,
                  ),)],
                ),
              ],
            ),
            _brandCategories()
          ],
        ),
      ),
    );
  }

  Widget _brandCategories() {
    return InkWell(
     child: ListView.builder(itemBuilder: itemBuilder)
    );
  }
}
