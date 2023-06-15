import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../api_provider/api_provider.dart';
import '../networking/api_response.dart';

AuthProvider getAuthStore(BuildContext context) {
  var store = Provider.of<AuthProvider>(context, listen: false);
  return store;
}

class AuthProvider extends ChangeNotifier {
  final ApiProvider _apiHelper = ApiProvider();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  changeLoadingStatus(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<bool> login(
      {required String username, required String password}) async {
    changeLoadingStatus(true);
    //{
    //       'username': 'kminchelle',
    //       'password': '0lelplR',
    //     }
    ApiResponse apiResponse = await _apiHelper.login(
        {
          'username': 'kminchelle',
          'password': '0lelplR',
        }
    );
    if (apiResponse.status == Status.success && apiResponse.data != null) {
      try {
        if (apiResponse.code == 200) {
          return true;
        }
        changeLoadingStatus(false);
      } catch (e) {
        changeLoadingStatus(false);
      }
    } else {
      changeLoadingStatus(false);
    }
    return false;
  }
}
