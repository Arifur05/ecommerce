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

class _HomeWidgetContainerState extends State<HomeWidgetContainer>
    with SingleTickerProviderStateMixin {
  final List<Tab> mTabs = <Tab>[
    const Tab(text: 'Popular'),
    const Tab(text: 'Exclusive'),
    const Tab(text: 'On Sale'),
  ];
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: mTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  List<BrandModel> brands = [
    BrandModel.name('Sony',
        'https://brandmediacoalition.com/wp-content/uploads/2019/07/Sony-logo-BMS-2019.png'),
    BrandModel.name('Beats',
        'https://1000logos.net/wp-content/uploads/2016/10/Beats-by-Dr-Dre.jpg'),
    BrandModel.name('Apple',
        'https://cxoworldwide.com/wp-content/uploads/2019/06/Apple-to-Buy-Drive.ai-to-Push-Autonomous-Vehicle-Talent.jpg'),
    BrandModel.name('Microsoft',
        'https://warner.edu/wp-content/uploads/2020/05/Microsoft-Logo-2012-980x551.jpg'),
    BrandModel.name('Lenovo',
        'https://logosvector.net/wp-content/uploads/2015/07/new-lenovo-logo.png'),
    BrandModel.name('Acer',
        'https://usercontent.one/wp/blog.kevinwebb.co.uk/wp-content/uploads/2020/06/71CD8FFB-D972-4060-88E4-15760AAE574C.png'),
    BrandModel.name(
        'LG', 'https://cdn.siasat.com/wp-content/uploads/2021/01/LG-Logo.webp'),
    BrandModel.name('SkullCandy',
        'https://assets.simpleviewinc.com/simpleview/image/fetch/q_75/https://assets.simpleviewinc.com/simpleview/image/upload/crm/parkcity/Skullcandy_logo0-83143e415056b3a_83143f59-5056-b3a8-497cce650423aa3d.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
            ),
            brandCategories(),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    controller: _controller,
                    tabs: mTabs),

            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: mTabs.map((Tab tab) {
                  return Center(child: Text(tab.text.toString()));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget brandCategories() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 120.0,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3.0,
                child: Column(
                  children: [
                    Image.network(brands[index].photourl,
                        height: 70, width: 80, fit: BoxFit.contain),
                    Text(brands[index].name),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
