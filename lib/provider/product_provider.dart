import 'package:firstcry/model/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../api_provider/api_provider.dart';
import '../networking/api_response.dart';

ProductProvider getProductStore(BuildContext context) {
  var store = Provider.of<ProductProvider>(context, listen: false);
  return store;
}

class ProductProvider extends ChangeNotifier {
  final ApiProvider _apiHelper = ApiProvider();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Products> _products = [];

  List<Products> get products => _products;

  changeLoadingStatus(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> getProduct() async {
    changeLoadingStatus(true);
    ApiResponse apiResponse = await _apiHelper.getProducts();
    if (apiResponse.status == Status.success && apiResponse.data != null) {
      _products  = productsFromJson(apiResponse.data);
      print('_products ${_products.length}');
      try {

        changeLoadingStatus(false);
      } catch (e) {
        changeLoadingStatus(false);
      }
    } else {
      changeLoadingStatus(false);
    }
  }
}
