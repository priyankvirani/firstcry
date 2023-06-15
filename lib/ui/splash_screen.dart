import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import '../configs/app_routes.dart';
import '../constants/app_assets.dart';
import '../constants/size_constants.dart';
import '../helper/shared_preference_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    bool isLogin = SharedPref.pref!.getBool(Preferences.IS_USER_LOGIN) ?? false;

    _timer = Timer(const Duration(seconds: 2), () async {
      if (isLogin) {
        navKeyRoot.currentState?.pushReplacementNamed(AppRoutes.login);
      } else {
        navKeyRoot.currentState?.pushReplacementNamed(AppRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.padding_45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.logo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
