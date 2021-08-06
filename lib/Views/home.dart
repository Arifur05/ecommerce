import 'package:ecommerce/Views/bottom_navigation/cartpage.dart';
import 'package:ecommerce/Views/bottom_navigation/categoriespage.dart';
import 'package:ecommerce/Views/bottom_navigation/homepage.dart';
import 'package:ecommerce/Views/bottom_navigation/profilepage.dart';
import 'package:flutter/material.dart';
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
            buildBottomNav("home.svg", 0),
            buildBottomNav("menu.svg", 1),
            buildBottomNav("shopping-cart.svg", 2),
            buildBottomNav("user.svg", 3),

          ],
        ),
      ),
    );
  }

  Widget buildBottomNav(String icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
          _pageController.jumpToPage(_selectedItem);
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        height: 50.0,
        width: MediaQuery
            .of(context)
            .size
            .width / 4,
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 30,
              width: 30,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: SvgPicture.asset(
                  icon,
                  color: index == _selectedItem ? Colors.grey : Colors.grey[700],
                  height: 21,
                  width: 21,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
