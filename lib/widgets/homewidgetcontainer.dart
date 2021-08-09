import 'dart:ui';

import 'package:ecommerce/Models/brandsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeWidgetContainer extends StatefulWidget {
  const HomeWidgetContainer({Key? key}) : super(key: key);

  @override
  _HomeWidgetContainerState createState() => _HomeWidgetContainerState();
}

class _HomeWidgetContainerState extends State<HomeWidgetContainer> {
  List<BrandModel> brands = [
    BrandModel.name('Sony', 'https://www.blugraphic.com/wp-content/uploads/2014/05/Sony2.jpg'),
    BrandModel.name('Beats', '_photourl'),
    BrandModel.name('Apple', '_photourl'),
    BrandModel.name('Microsoft', '_photourl'),
    BrandModel.name('Lenovo', '_photourl'),
    BrandModel.name('Acer', '_photourl'),
    BrandModel.name('LG', '_photourl'),
    BrandModel.name('SkullCandy', '_photourl'),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(

        //padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                    mainAxisSize: MainAxisSize.min,

                    children: const [
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          //letterSpacing: 0.5,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              brandCategories()
            ],
          ),
        ),

    );
  }

  Widget brandCategories() {
    return InkWell(
      child: SizedBox(
        height:150.0,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Card(
                child: SizedBox(
                  height:50.0,
                  width: 200,
                  child: ListTile(
                    onTap: (){},
                    title: Text(brands[index].name),
                    //leading: Image.network(brands[index].photourl.toString(),scale: 2.0,),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
