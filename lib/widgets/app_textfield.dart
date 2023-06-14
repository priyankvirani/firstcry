import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/size_constants.dart';

class AppManageAccountTextFiled extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final String? hint;
  final bool readOnly;
  final String label;
  final FormFieldValidator? validator;
  final int maxLine;

  const AppManageAccountTextFiled(
      {Key? key,
      required this.controller,
      this.onTap,
      this.suffixIcon,
      this.hint,
      this.readOnly = false,
      required this.label,
      this.validator,
      this.maxLine = 1})
      : super(key: key);

  @override
  State<AppManageAccountTextFiled> createState() =>
      _AppManageAccountTextFiledState();
}

class _AppManageAccountTextFiledState extends State<AppManageAccountTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: widget.readOnly
                  ? SizeConstants.margin_0
                  : SizeConstants.margin_10),
          padding: widget.readOnly
              ? const EdgeInsets.symmetric(
                  horizontal: SizeConstants.padding_20,
                  vertical: SizeConstants.padding_10)
              : const EdgeInsets.only(
                  left: SizeConstants.padding_20,
                  right: SizeConstants.padding_20,
                  bottom: SizeConstants.padding_15,
                  top: SizeConstants.padding_10),
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
                color: grey02,
              ),
              border: widget.readOnly
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: grey03,
                          width: SizeConstants.dimen_1_5),
                    ),
              enabledBorder: widget.readOnly
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: grey03,
                          width: SizeConstants.dimen_1_5),
                    ),
              focusedBorder: widget.readOnly
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: grey03,
                          width: SizeConstants.dimen_1_5),
                    ),
            ),
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
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SizeConstants.padding_10,
                      vertical: SizeConstants.padding_2),
                  margin: const EdgeInsets.only(left: SizeConstants.margin_20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeConstants.radius_60,
                      ),
                      color: orange),
                  child: Text(widget.label,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: white,
                        fontSize: SizeConstants.fontSize_12,
                      )),
                ),
              ),
      ],
    );
  }
}
