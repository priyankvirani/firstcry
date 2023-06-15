import 'package:firstcry/constants/size_constants.dart';
import 'package:firstcry/utils/app_utils.dart';
import 'package:firstcry/widgets/app_button.dart';
import 'package:firstcry/widgets/app_label.dart';
import 'package:firstcry/widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import '../configs/app_routes.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/string_constants.dart';
import '../helper/shared_preference_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailID = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
              const SizedBox(
                height: SizeConstants.height_20,
              ),
              label(StringConstants.loginRegisterText),
              const SizedBox(
                height: SizeConstants.height_20,
              ),
              Form(
                key: formKey,
                child: AppTextFiled(
                  controller: emailID,
                  hint: StringConstants.emailIdHintText,
                  label: StringConstants.emailIdText,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return StringConstants.emailIdErrorText;
                    } else {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value.toString())
                          ? null
                          : StringConstants.emailIdValidErrorText;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: SizeConstants.height_20,
              ),
              AppButton(
                label: StringConstants.continueText,
                backgroundColor: orange,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    SharedPref.pref!.setBool(Preferences.IS_USER_LOGIN, true);
                    navKeyRoot.currentState?.pushReplacementNamed(AppRoutes.home);
                  }
                },
              ),
              const SizedBox(
                height: SizeConstants.height_20,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: StringConstants.loginScreenRegisterText,
                    style: const TextStyle(
                        color: blue,
                        fontSize: SizeConstants.fontSize_13,
                        fontFamily: AppFonts.robotoBoldItalic,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        navKeyRoot.currentState
                            ?.pushNamed(AppRoutes.register);
                      },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConstants.margin_18,
              ),
              const Divider(
                height: 2,
                color: grey03,
              ),
              const SizedBox(
                height: SizeConstants.margin_18,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'By continuing, you agree to Firstcry\'s ',
                  style: const TextStyle(
                    fontSize: 12,
                    color: black,
                    fontFamily: AppFonts.robotoLight,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Conditions of Use',
                      style: const TextStyle(
                        fontSize: 12,
                        color: blue,
                        fontFamily: AppFonts.robotoLight,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AppUtils.openUrl(
                              'https://www.firstcry.com/termsofuse');
                        },
                    ),
                    const TextSpan(
                        text: ' and',
                        style: TextStyle(
                          fontSize: 12,
                          color: black,
                          fontFamily: AppFonts.robotoLight,
                        )),
                    TextSpan(
                      text: ' Privacy Notice.',
                      style: const TextStyle(
                        fontSize: 12,
                        color: blue,
                        fontFamily: AppFonts.robotoLight,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AppUtils.openUrl(
                              'https://www.firstcry.com/privacypolicy');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
