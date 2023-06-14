import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import '../configs/app_routes.dart';

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
    _timer = Timer(const Duration(seconds: 2), () async {
      navKeyRoot.currentState?.pushReplacementNamed(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
