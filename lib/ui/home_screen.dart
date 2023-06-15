import 'package:firstcry/constants/app_fonts.dart';
import 'package:firstcry/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../widgets/common_bottom_navigation.dart';
import '../widgets/my_drawer.dart';

import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _key = new GlobalKey();

  ///function for app exit on double back press
  static const snackBarDuration = Duration(seconds: 3);
  DateTime? backButtonPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (backButtonPressTime == null ||
        now.difference(backButtonPressTime!) > Duration(seconds: 2)) {
      backButtonPressTime = now;
      AppUtils.showToast('Press again to exit the app');

      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                width: 15,
                height: 15,
                child: Image.asset(
                  AppAssets.kidsProfile,
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'Shop for,',
                    style: TextStyle(fontSize: 12, color: black),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: black,
                    size: 14,
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Hriday 1Y M,',
                style: TextStyle(fontSize: 12, color: black),
              ),
            ],
          ),
          titleSpacing: 00.0,
          //centerTitle: false,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          elevation: 0.00,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Icon(
                      Icons.search,
                      color: grey03,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(badgeColor: orange),
                      badgeContent: Text(
                        '01',
                        style: TextStyle(
                            fontSize: 8,
                            color: white,
                            fontFamily: AppFonts.robotoRegular),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: grey03,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(badgeColor: orange),
                      badgeContent: Text(
                        '02',
                        style: TextStyle(
                            fontSize: 8,
                            color: white,
                            fontFamily: AppFonts.robotoRegular),
                      ),
                      child: Icon(
                        Icons.heart_broken_sharp,
                        color: grey03,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(badgeColor: orange),
                      badgeContent: Text(
                        '03',
                        style: TextStyle(
                            color: white,
                            fontSize: 8,
                            fontFamily: AppFonts.robotoRegular),
                      ),
                      child: Icon(
                        Icons.shopping_cart_sharp,
                        color: grey03,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            )
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: CommonBottomNavigation(
          currentTab: _selectedIndex,
          onSelectTab: (int value) {
            _onItemTapped(value);
          },
        ),
      ),
    );
  }
}
