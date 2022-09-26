import 'package:flutter/material.dart';
import 'package:make_my_dish/constends/colors.dart';
import 'package:make_my_dish/constends/text_style.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key, required this.text, this.onTap}) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: onTap,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: ColorManager.whiteColor,
            iconSize: 24,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: TextStyleManager.headerTextStyle,
          )
        ],
      ),
    );
  }
}
