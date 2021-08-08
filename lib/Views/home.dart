import 'package:ecommerce/Views/bottom_navigation/cartpage.dart';
import 'package:ecommerce/Views/bottom_navigation/categoriespage.dart';
import 'package:ecommerce/Views/bottom_navigation/homepage.dart';
import 'package:ecommerce/Views/bottom_navigation/profilepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreen();
}

class MainScreen extends State<Home> {
  int _selectedItem = 0;

  PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomePage(),
    CategoriesPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Row(
          children: [
            buildBottomNav("images/home.svg", 0),
            buildBottomNav("images/menu.svg", 1),
            buildBottomNav("images/shopping-cart.svg", 2),
            buildBottomNav("images/user.svg", 3),
          ],
        ),
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChange,
            children: _pages,
          ),
        ),
      ),
    );
  }

  Widget buildBottomNav(
    String icon,
    int index,
    //VoidCallback? onClicked
  ) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        setState(() {
          _selectedItem = index;
          _pageController.jumpToPage(_selectedItem);
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0x44e8e8ff),
        ),
        height: 60.0,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Container(
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: SvgPicture.asset(
                  icon,
                  height: 20.0,
                  width: 20.0,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.cover,
                  color: index == _selectedItem ? Colors.black : Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  void _onPageChange(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}
