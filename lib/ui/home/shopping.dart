import 'dart:async';

import 'package:firstcry/configs/app_routes.dart';
import 'package:firstcry/constants/app_assets.dart';
import 'package:firstcry/constants/app_colors.dart';
import 'package:firstcry/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Category {
  String image;
  String title;

  Category(this.title, this.image);
}

class ShoppingScreen extends StatefulWidget {
  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen>
    with SingleTickerProviderStateMixin {
  List<String> bannerList = [
    AppAssets.slide1,
    AppAssets.slide2,
    AppAssets.slide3,
    AppAssets.slide4,
    AppAssets.slide5,
    AppAssets.slide6,
    AppAssets.slide7,
    AppAssets.slide8
  ];

  List<String> bannerSmallList = [
    AppAssets.banner1,
    AppAssets.banner2,
    AppAssets.banner3,
  ];

  List<Category> categoryList = [
    Category("BOYS FASHION\n0-6 MONTHS", AppAssets.category),
    Category("SOCKS & BOOTIES", AppAssets.category),
    Category("FASHION\nACCESSORIES", AppAssets.category),
    Category("DIAPERING", AppAssets.category),
    Category("BATH & SKIN CARE", AppAssets.category),
    Category("FEEDING &\nNURSING", AppAssets.category),
    Category("HEALTHY &\nSAFETY", AppAssets.category),
    Category("BABY GEAR", AppAssets.category),
    Category("NURSERY", AppAssets.category),
    Category("BIRTHDAY", AppAssets.category),
    Category("TOYS", AppAssets.category),
    Category("GIFT", AppAssets.category),
  ];

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage != bannerList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: grey04,
            width: double.infinity,
            child: Row(
              children: const [
                Icon(
                  Icons.location_on_outlined,
                  color: grey03,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  StringConstants.selectLocation,
                  style: TextStyle(fontSize: 12),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: grey03,
                )
              ],
            ),
          ),
          SizedBox(
            height: 350,
            child: Stack(
              children: [
                SizedBox(
                  height: 350,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (value) {
                      //When page change, start the controller
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, AppRoutes.product);
                        },
                        child: Image.asset(
                          bannerList[index],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    itemCount: bannerList.length,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: bannerList.length,
                      effect: const ColorTransitionEffect(
                          activeDotColor: Colors.white,
                          dotColor: grey05,
                          dotHeight: 8,
                          dotWidth: 8,
                          offset: 5),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.product);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      bannerSmallList[index],
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: bannerSmallList.length,
            ),
          ),
          Container(
            height: 0.5,
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              StringConstants.shopCategory,
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          MasonryGridView.count(
            crossAxisCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, AppRoutes.product);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2), width: 0.5)),
                  height: 150,
                  child: Column(
                    children: [
                      Image.asset(
                        categoryList[index].image,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 27,
                        child: Center(
                          child: Text(
                            categoryList[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Container(
            height: 0.5,
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          Image.asset(AppAssets.superSummer),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.product);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppAssets.megaDeal,
                      height: double.infinity,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(AppAssets.explore),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.product);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppAssets.win,
                      height: double.infinity,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
