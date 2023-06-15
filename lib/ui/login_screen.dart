import 'package:firstcry/constants/size_constants.dart';
import 'package:firstcry/provider/product_provider.dart';
import 'package:firstcry/utils/app_utils.dart';
import 'package:firstcry/widgets/app_button.dart';
import 'package:firstcry/widgets/app_label.dart';
import 'package:firstcry/widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app.dart';
import '../configs/app_routes.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/string_constants.dart';
import '../helper/shared_preference_helper.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late bool _passwordVisibleToggle = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, snapshot) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(SizeConstants.padding_45),
            child: Stack(
              children: [
                Column(
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
                      child: Column(
                        children: [
                          AppTextFiled(
                            controller: username,
                            hint: StringConstants.userNameHintText,
                            label: StringConstants.userNameText,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return StringConstants.userNameErrorText;
                              } else {
                                null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: SizeConstants.height_8,
                          ),
                          AppTextFiled(
                            controller: password,
                            hint: StringConstants.passwordHintText,
                            label: StringConstants.passwordText,
                            isObscureText: _passwordVisibleToggle,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _passwordVisibleToggle =
                                      !_passwordVisibleToggle;
                                });
                              },
                              child: Icon(
                                _passwordVisibleToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: orange,
                              ),
                            ),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return StringConstants.passwordErrorText;
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
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
                          authProvider
                              .login(username: 'username', password: 'password')
                              .then((value) {
                            if (value) {
                              SharedPref.pref!
                                  .setBool(Preferences.IS_USER_LOGIN, true);
                              navKeyRoot.currentState
                                  ?.pushReplacementNamed(AppRoutes.home);
                            } else {
                              AppUtils.showToast('Invalid credentials',
                                  color: Colors.red);
                            }
                          });
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
                if (authProvider.isLoading)
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
            ),
          ),
        ),
      );
    });
  }
}
