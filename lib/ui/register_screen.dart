import 'package:flutter/cupertino.dart';

import 'package:firstcry/constants/size_constants.dart';
import 'package:firstcry/utils/app_utils.dart';
import 'package:firstcry/widgets/app_button.dart';
import 'package:firstcry/widgets/app_label.dart';
import 'package:firstcry/widgets/app_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import '../configs/app_routes.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/string_constants.dart';
import '../helper/shared_preference_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailID = TextEditingController();
  TextEditingController password = TextEditingController();
  late bool _passwordVisibleToggle = true;

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
              label(StringConstants.registerText),
              const SizedBox(
                height: SizeConstants.height_20,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextFiled(
                      controller: fullName,
                      hint: StringConstants.fullNameHintText,
                      label: StringConstants.fullNameText,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return StringConstants.fullNameErrorText;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: SizeConstants.height_8,
                    ),
                    AppTextFiled(
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
                            _passwordVisibleToggle = !_passwordVisibleToggle;
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
                          return RegExp(
                                      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
                                  .hasMatch(value.toString())
                              ? null
                              : StringConstants.passwordValidErrorText;
                        }
                      },
                    ),
                    const SizedBox(
                      height: SizeConstants.margin_2,
                    ),
                    const Text(
                      StringConstants.passwordMustBeText,
                      style: TextStyle(
                          color: black,
                          fontSize: SizeConstants.fontSize_12,
                          fontFamily: AppFonts.robotoThin),
                    )
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
                    SharedPref.pref!.setBool(Preferences.IS_USER_LOGIN, true);
                    navKeyRoot.currentState
                        ?.pushReplacementNamed(AppRoutes.home);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
