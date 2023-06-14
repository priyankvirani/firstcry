import 'package:firstcry/constants/size_constants.dart';
import 'package:firstcry/widgets/app_button.dart';
import 'package:firstcry/widgets/app_label.dart';
import 'package:firstcry/widgets/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/string_constants.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.padding_40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              label(StringConstants.loginRegisterText),
              const SizedBox(
                height: SizeConstants.height_20,
              ),
              AppTextFiled(
                controller: emailID,
                hint: StringConstants.emailIdHintText,
                label: StringConstants.emailIdText,
              ),
              const SizedBox(
                height: SizeConstants.height_20,
              ),
              AppButton(
                label: 'CONTINUE',
                backgroundColor: orange,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
