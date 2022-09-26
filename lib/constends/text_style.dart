import 'package:flutter/material.dart';
import 'package:make_my_dish/constends/colors.dart';

class TextStyleManager {
  static const headerTextStyle = TextStyle(
      color: ColorManager.whiteColor,
      fontSize: 28,
      fontWeight: FontWeight.w700);
  static const textFieldHeading = TextStyle(
      color: ColorManager.black, fontSize: 16, fontWeight: FontWeight.w500);

  static const textFieldHintStyle = TextStyle(
      color: Color.fromARGB(140, 60, 58, 58),
      fontSize: 18,
      fontWeight: FontWeight.w500);

  static const authButtonTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: ColorManager.whiteColor);
  static const textFieldstyle = TextStyle(
      color: ColorManager.greyLight, fontSize: 25, fontWeight: FontWeight.w600);
}
