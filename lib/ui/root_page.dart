
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/cart_page.dart';
import 'package:flutter_onboarding/ui/favorite_page.dart';
import 'package:flutter_onboarding/ui/home_page.dart';
import 'package:flutter_onboarding/ui/profile_page.dart';
import 'package:flutter_onboarding/ui/scan_plant.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> titleList = [
    'Home',
    'Favorites',
    'Cart',
    'Profile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
            ),),
            Icon(Icons.notifications, color: Constants.blackColor, size: 30.0,),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
      index: _bottomNavIndex,
      children: pages,
    ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint('Open Scanner');
              Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: const ScanPlant()));
            },
            child: Image.asset('assets/images/code-scan-two.png', height: 30,),
            backgroundColor: Constants.primaryColor,
          //params
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
