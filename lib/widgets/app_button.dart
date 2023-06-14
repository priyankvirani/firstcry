import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/size_constants.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final double? textSize;
  final Widget? suffixIcon;

  const AppButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.backgroundColor = white,
      this.borderColor = white,
      this.borderRadius = SizeConstants.circularRadius_4,
      this.height = SizeConstants.dimen_45,
      this.width,
      this.margin = const EdgeInsets.only(bottom: SizeConstants.padding_18),
      this.padding,
      this.textColor = white,
      this.textSize = SizeConstants.dimen_14,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: white,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: Colors.grey.withOpacity(0.4),
          textStyle: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          side: BorderSide(color: borderColor!, style: BorderStyle.solid),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (suffixIcon != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConstants.dimen_4),
                child: suffixIcon!,
              ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
