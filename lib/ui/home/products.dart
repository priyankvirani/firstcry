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
              childAspectRatio: 0.75,
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
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: productProvider.products[index].image,
                                fit: BoxFit.fitHeight,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConstants.margin_4,
                      ),
                      Text(
                        productProvider.products[index].title,
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
