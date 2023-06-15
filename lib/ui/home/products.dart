import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstcry/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/size_constants.dart';
import '../../provider/auth_provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getProductStore(context).getProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (context, productProvider, snapshot) {
      return Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.80,
            ),
            itemCount: productProvider.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey05, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: SizeConstants.margin_8,
                      ),
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: productProvider.products[index].image,
                                fit: BoxFit.fitHeight,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.bookmark_outline,
                                  color: grey03,
                                  size: 18,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    height: 18,
                                    width: 70,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border:
                                          Border.all(color: grey03, width: 0.2),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${productProvider.products[index].rating.rate} ',
                                          style: const TextStyle(
                                            color: black,
                                            fontSize: 10,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.star,
                                          size: 10,
                                          color: Colors.green,
                                        ),
                                        const SizedBox(
                                          width: SizeConstants.margin_2,
                                        ),
                                        const VerticalDivider(
                                          width: 1,
                                          color: Colors.black,
                                          thickness: 0.2,
                                        ),
                                        const SizedBox(
                                          width: SizeConstants.margin_2,
                                        ),
                                        Text(
                                          '${productProvider.products[index].rating.count}',
                                          style: const TextStyle(
                                            color: black,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConstants.margin_4,
                      ),
                      Text(
                        productProvider.products[index].title,
                        maxLines: 2,
                        style: const TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: SizeConstants.margin_4,
                      ),
                      Text(
                        productProvider.products[index].category,
                        style: const TextStyle(
                          color: black,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: SizeConstants.margin_4,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: '\$ ${productProvider.products[index].price} ',
                          style: const TextStyle(
                            fontSize: 12,
                            color: black,
                            fontFamily: AppFonts.robotoLight,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: '\$ 50',
                              style: TextStyle(
                                fontSize: 12,
                                color: grey03,
                                fontFamily: AppFonts.robotoLight,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: ' (50% OFF)',
                              style: TextStyle(
                                fontSize: 12,
                                color: orange,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.robotoLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          if (productProvider.isLoading)
            const Center(
              child: SizedBox(
                width: SizeConstants.dimen_30,
                height: SizeConstants.dimen_30,
                child: CircularProgressIndicator(
                  color: orange,
                  strokeWidth: 1.5,
                ),
              ),
            )
        ],
      );
    });
  }
}
