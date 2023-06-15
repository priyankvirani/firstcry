import 'package:badges/badges.dart' as badges;
import 'package:firstcry/constants/app_assets.dart';
import 'package:firstcry/constants/app_colors.dart';
import 'package:firstcry/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> productImageList = [
    AppAssets.product1,
    AppAssets.product2,
    AppAssets.product3,
    AppAssets.product4
  ];

  int _currentPage = 0;

  List<String> sizeList = [
    "New Born",
    "0 - 3 M",
    "3 - 6 M",
    "6 - 9 M",
    "9 - 12 M",
    "12 - 18 M",
    "18 - 24 M"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.keyboard_backspace_sharp,
              color: Colors.black,
            ),
          ),
        ),
        title: Image.asset(
          AppAssets.cry,
          width: 100,
        ),
        titleSpacing: 0.0,
        leadingWidth: 40,
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
                  child: Icon(
                    Icons.share,
                    color: grey03,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: badges.Badge(
                    badgeStyle: badges.BadgeStyle(badgeColor: orange),
                    badgeContent: Text(
                      '0',
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (value) {
                              //When page change, start the controller
                              setState(() {
                                _currentPage = value;
                              });
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                productImageList[index],
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                            itemCount: productImageList.length,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black.withOpacity(0.9)),
                            child: Text(
                              "${_currentPage + 1} / ${productImageList.length}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            margin: const EdgeInsets.only(bottom: 5, right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: orange),
                            child: const Icon(
                              Icons.copy,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Babyhug 100% Cotton Knit Half Sleeves T-Shirt & Dungaree Set Tent Print - White & Green",
                          style: TextStyle(height: 1.5, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "₹ 710.21",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              AppAssets.heart,
                              height: 15,
                              width: 15,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Text(
                              "MRP: ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: grey02,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "₹ 899.00",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: grey02,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "21% OFF",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "MRP incl. all taxes, Add'l charges may apply on discounted price",
                          style: TextStyle(
                            fontSize: 10,
                            color: grey02,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    color: grey04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "SIZE",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: selectedIndex == index
                                              ? orange
                                              : grey03.withOpacity(0.5))),
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      sizeList[index],
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                            itemCount: sizeList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    color: grey04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppAssets.fastDelivery,
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "FASTER DELIVERY",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: "Delivered by",
                            style: TextStyle(
                              color: grey02,
                              fontSize: 11,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Today,',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: black)),
                              TextSpan(
                                  text: ' If you order in',
                                  style: TextStyle(
                                    color: grey02,
                                  )),
                              TextSpan(
                                  text: ' 1 hour & 36 minutes',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              TextSpan(
                                  text: ' [?]',
                                  style: TextStyle(
                                    color: blue,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: "Delivers to",
                            style: TextStyle(
                              color: grey02,
                              fontSize: 11,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Downtown, Dubai Area, Dubai',
                                  style: TextStyle(
                                      color: blue,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    color: grey04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imageTile(AppAssets.gift, "Gift\nWrap"),
                      imageTile(AppAssets.cashDelivery, "COD\nAvailable"),
                      imageTile(AppAssets.thirty, "Days Return\nor Exchange",
                          isWord: true)
                    ],
                  ),
                  Container(
                    height: 3,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    color: grey04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "PRODUCT DESCRIPTION",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ReadMoreText(
                          '''
Brand - Robo Fry
Type - Party Suit
Fabric - Polyester/Woven
Shirt Sleeves - Full Sleeves
Shirt Neck - Collar Neck
Waist coat Sleeves - Sleeveless
Waist coat Neck - V Neck
Trouser Length - Full Length
Closure - Front Button Closure
Pattern - Solid
Occasion - Party Wear
Fit - Regular

Items Included in Package

1 Shirt With Bow, 1 Waistcoat, 1 Trouser and 1 Cap

Styling Tip: Team up this set with formal shoes to complete the look


Note: To confirm sizes please refer to the measurement link available at size chart above

Country of Origin: India
e-Code: 0
Government Scheme: 0

Note : Mix of Taxes and discount may change depending the amount of tax being borne by the Company. However, the final price as charged from customer will remain same. Taxes collected against every transaction will be paid to the Government by FirstCry.com. Please refer to the Terms of Use for full details.''',
                          trimLines: 2,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          style: TextStyle(fontSize: 12, color: black),
                          lessStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          moreStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Container(
                  width: 130,
                  color: grey01,
                  height: 45,
                  child: Center(
                    child: Container(
                      height: 25,
                      width: 110,
                      decoration: BoxDecoration(
                          color: grey04,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "NEW BORN",
                            style: TextStyle(fontSize: 12),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: grey02,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: orange,
                    height: 45,
                    child: const Center(
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  imageTile(String image, String title, {bool isWord = false}) {
    return SizedBox(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: orange, width: 2)),
            padding: EdgeInsets.all(isWord ? 0 : 4),
            height: 30,
            width: 30,
            child: Image.asset(
              image,
              color: orange,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
