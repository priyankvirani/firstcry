import 'package:flutter/material.dart';

import '../app.dart';
import '../configs/app_routes.dart';
import '../constants/app_colors.dart';
import '../constants/string_constants.dart';
import '../helper/shared_preference_helper.dart';
import 'app_button.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppButton(
                    label: StringConstants.logoutText,
                    backgroundColor: orange,
                    onPressed: () {
                      SharedPref.pref!
                          .setBool(Preferences.IS_USER_LOGIN, false);
                      navKeyRoot.currentState?.pushReplacementNamed('/');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
