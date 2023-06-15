import 'package:firstcry/constants/app_colors.dart';
import 'package:firstcry/constants/size_constants.dart';
import 'package:flutter/cupertino.dart';

Widget label(String value) {
  return Text(
    value,
    style: const TextStyle(
      color: black,
      fontSize: SizeConstants.fontSize_18,
      fontWeight: FontWeight.bold,
    ),
  );
}
