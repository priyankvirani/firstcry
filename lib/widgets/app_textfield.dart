import 'package:firstcry/constants/app_fonts.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/size_constants.dart';

class AppTextFiled extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final String? hint;
  final bool readOnly;
  final String label;
  final FormFieldValidator? validator;
  final int maxLine;
  final bool isObscureText;

  const AppTextFiled({
    Key? key,
    required this.controller,
    this.onTap,
    this.suffixIcon,
    this.hint,
    this.readOnly = false,
    required this.label,
    this.validator,
    this.maxLine = 1,
    this.isObscureText = false,
  }) : super(key: key);

  @override
  State<AppTextFiled> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: widget.readOnly
                  ? SizeConstants.margin_0
                  : SizeConstants.margin_10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConstants.radius_20),
              color: white),
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              isDense: true,
              suffixIconConstraints: const BoxConstraints(
                  minHeight: SizeConstants.dimen_20,
                  minWidth: SizeConstants.dimen_20),
              suffixIcon: widget.suffixIcon ?? const SizedBox(),
              hintText: widget.hint,
              hintStyle: const TextStyle(
                  color: grey02, fontSize: SizeConstants.fontSize_12),
              border: widget.readOnly
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: grey03, width: SizeConstants.dimen_1),
                    ),
              enabledBorder: widget.readOnly
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: grey03, width: SizeConstants.dimen_1),
                    ),
              focusedBorder: widget.readOnly
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: grey03, width: SizeConstants.dimen_1),
                    ),
            ),
            obscureText: widget.isObscureText,
            maxLines: widget.maxLine,
            style: const TextStyle(
              color: grey01,
            ),
            readOnly: widget.readOnly,
            cursorColor: white,
            onTap: widget.onTap,
            validator: widget.validator,
          ),
        ),
        widget.readOnly
            ? const SizedBox()
            : Positioned(
                top: 0,
                child: Text(widget.label,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: black,
                        fontSize: SizeConstants.fontSize_14,
                        fontFamily: AppFonts.robotoThin,
                        fontWeight: FontWeight.bold)),
              ),
      ],
    );
  }
}
